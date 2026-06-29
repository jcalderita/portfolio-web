---
title: AI Status Bar
slug: ai-status-bar
date: 2026-07-01
description: How I built a custom status bar in Claude Code to always see context, tokens and usage limits at a glance without spending a single extra token.
tags: AI, Shell
cover: AIStatusBar
coverDescription: Illustration of Jorge running along a dirt path beside a river with a medieval city in the background, while a status bar at the bottom shows data: model, progress bar, distance 150k/1000k, speed 15km/h, energy 67%, effort Medium and location Pamplona.
publish: true
---
---
## My Problem 🤔

When I work with <span class="high">Claude Code</span> in the shell, there is information I need to check constantly: how much context I have consumed, what percentage of my usage limits I am at, which git branch is active, which model I am working with. Information that does not change every second, but that I do need at hand to make decisions.

The problem is that getting it has friction. I can ask the AI directly, but that means spending tokens on a question whose answer is completely deterministic. I can also open another terminal session, or launch a background command to check it every so often. But all of those options interrupt the workflow.

What I really needed was something simpler: **a line that is always visible**, giving me that information without my having to ask for it, without consuming context, and without interrupting what I was doing.

---
## My Solution 🧩

<span class="high">Claude Code</span> has a feature called <span class="high">statusLine</span> that lets you define an external command which runs whenever the session changes: after each assistant response, when a <span class="high">/compact</span> finishes, when the permission mode changes, or when toggling vim mode. The tool calls the script, passes it information about the current session state as JSON over <span class="high">stdin</span>, and displays whatever the script returns on <span class="high">stdout</span> in the bottom bar of the interface.

The configuration lives in <span class="high">settings.json</span> and is a single line:

```json
{
  "statusLine": {
    "type": "command",
    "command": "zsh statusline-command.zsh"
  }
}
```

The JSON the script receives over <span class="high">stdin</span> contains all the relevant session information: active model, working directory, context usage percentage, total window size, and the usage limits for the 5-hour and 7-day periods, each with its percentage and reset timestamp.

The script runs on each of those events, with a 300 ms debounce that groups rapid changes. And here is an important detail: if a new event arrives while the script is still running, <span class="high">Claude Code</span> cancels the in-flight execution and launches a new one — a slow script would interrupt itself. That is why I wrote it to be cheap: zsh <span class="high">builtins</span> instead of subprocesses, a single call to <span class="high">jq</span> instead of nine, and helpers that return their result in <span class="high">REPLY</span> to avoid capturing it with <span class="high">$(...)</span> on the hot path.

The first step is to load the zsh date module and extract the nine JSON fields in a single pass. The output of <span class="high">jq</span> is an ordered list of values that I capture positionally with <span class="high">read</span>:

```bash
#!/bin/zsh

zmodload zsh/datetime

MAGENTA=$'\e[35m'; CYAN=$'\e[36m'; YELLOW=$'\e[33m'; GREEN=$'\e[32m'
BLUE=$'\e[34m';    RED=$'\e[31m';  DIM=$'\e[2m';     RESET=$'\e[0m'

input=$(</dev/stdin)
{
    read -r model_display_name
    read -r current_dir
    read -r used_percentage
    read -r context_window_size
    read -r five_hour_pct
    read -r five_hour_reset
    read -r seven_day_pct
    read -r seven_day_reset
    read -r effort_level
} < <(jq -r '
    .model.display_name // "",
    .workspace.current_dir // "",
    (.context_window.used_percentage // 0),
    (.context_window.context_window_size // 0),
    (.rate_limits.five_hour.used_percentage as $p | if $p then ($p | floor) else "" end),
    (.rate_limits.five_hour.resets_at // ""),
    (.rate_limits.seven_day.used_percentage as $p | if $p then ($p | floor) else "" end),
    (.rate_limits.seven_day.resets_at // ""),
    ((.effortLevel // .effort) as $e | if ($e | type) == "object" then $e.level else ($e // "") end)
' <<<"$input")
```

With that I have the nine variables populated with a single <span class="high">fork</span> of <span class="high">jq</span>. If the effort level did not come in the JSON, I look for it first in the project's <span class="high">settings.json</span> and, if it is not there either, in the user's. Then I compute the derived values and build the progress bar with zsh's native left-padding:

```bash
extract_effort='(.effortLevel // .effort // empty) | if type == "object" then .level else . end // empty'
[[ -z "$effort_level" && -f "$current_dir/.claude/settings.json" ]] && \
    effort_level=$(jq -r "$extract_effort" "$current_dir/.claude/settings.json" 2>/dev/null)
[[ -z "$effort_level" && -f "$HOME/.claude/settings.json" ]] && \
    effort_level=$(jq -r "$extract_effort" "$HOME/.claude/settings.json" 2>/dev/null)

current_tokens=$(( used_percentage * context_window_size / 100 ))
current_k=$(( current_tokens / 1000 ))
max_k=$(( context_window_size / 1000 ))
project_name=${current_dir:t}
git_branch=$(git -C "$current_dir" -c core.fileMode=false rev-parse --abbrev-ref HEAD 2>/dev/null)

bar_width=20
filled=$(( used_percentage * bar_width / 100 ))
empty=$(( bar_width - filled ))
progress_bar="${(l:filled::=:):-}${(l:empty:: :):-}"
```

Details that avoid child processes: <span class="high">${current_dir:t}</span> is the native equivalent of <span class="high">basename</span>, and <span class="high">${(l:filled::=:):-}</span> builds a left-padded string of <span class="high">=</span> characters with no loops or concatenation.

Then come the color thresholds. In the first version I had two almost identical functions, one for percentages and one for absolute tokens. I unified them into a single one that takes the value and the two thresholds as arguments, and took the chance to have it return the result in <span class="high">REPLY</span> instead of printing it:

```bash
threshold_color() {
    if (( $1 >= $2 )); then REPLY=$RED
    elif (( $1 >= $3 )); then REPLY=$YELLOW
    else REPLY=$GREEN
    fi
}

format_reset() {
    REPLY=
    [[ -z "$1" ]] && return
    if (( $1 - EPOCHSECONDS < 86400 )); then
        strftime -s REPLY '%H:%M' $1
    else
        strftime -s REPLY '%a %H:%M' $1
    fi
}

build_rate_part() {
    local part
    if [[ -n "$2" ]]; then
        threshold_color $2 80 50
        part="${MAGENTA}$1:${RESET} ${REPLY}$2%${RESET}"
    else
        part="${MAGENTA}$1:${RESET} ${DIM}-${RESET}"
    fi
    format_reset $3
    [[ -n "$REPLY" ]] && part+=" ${DIM}($REPLY)${RESET}"
    REPLY=$part
}
```

Applying those thresholds:

- <span class="high-green">Green context</span> below 100k tokens — safe zone
- <span class="high-yellow">Yellow context</span> between 100k and 150k tokens — a signal to consider a <span class="high">/clear</span>
- <span class="high-red">Red context</span> above 150k tokens — time to act

The same for the 5-hour and 7-day usage limits: green below 50%, yellow between 50% and 79%, red from 80% on.

All three functions return in <span class="high">REPLY</span>: this saves me the <span class="high">$(...)</span> and its associated subshell on every call, which reduces the risk of an invocation cancelling itself when events arrive back to back. <span class="high">format_reset</span> draws on the <span class="high">strftime</span> builtin and on <span class="high">$EPOCHSECONDS</span> from the <span class="high">zsh/datetime</span> module, so it does not spin up a <span class="high">date</span> process each time either.

Finally, the composition. The first line always carries the same elements: model, progress bar, context percentage, current tokens over the maximum, and project name. The second is built only from the parts that have data — if there is no 5h limit, no configured effort level, or no git branch, they simply do not appear and the separators adjust:

```bash
threshold_color $current_tokens 150000 100000
context_color=$REPLY
status_line="${MAGENTA}${model_display_name}${RESET} ${CYAN}[${RESET}${progress_bar}${CYAN}]${RESET}"
status_line+=" ${context_color}${used_percentage}%${RESET} |"
status_line+=" ${context_color}${current_k}k/${max_k}k${RESET} |"
status_line+=" ${BLUE}${project_name}${RESET}"

typeset -a parts
build_rate_part 5h "$five_hour_pct" "$five_hour_reset"; parts+=("$REPLY")
build_rate_part 7d "$seven_day_pct" "$seven_day_reset"; parts+=("$REPLY")
[[ -n "$effort_level" ]] && parts+=("${MAGENTA}effort:${RESET} ${YELLOW}${effort_level}${RESET}")
[[ -n "$git_branch" ]]   && parts+=("${GREEN}${git_branch}${RESET}")

sep=" ${CYAN}|${RESET} "
(( ${#parts} )) && status_line+=$'\n'"${(pj.$sep.)parts}"

print -rn -- "$status_line"
```

The expansion <span class="high">${(pj.$sep.)parts}</span> joins the elements of the <span class="high">parts</span> array with the <span class="high">sep</span> separator — a native zsh join, with no loops or <span class="high">IFS</span> hacks.

An important detail about the reset time: the script formats it as <span class="high">HH:MM</span> if the reset happens within the next 24 hours, and as <span class="high">Day HH:MM</span> if it is later. That way I know at a glance when the limit frees up without doing any math.

---
## My Result 🎯

The result is exactly what I was after: information that is always present without interrupting anything or spending a single token to get it.

What I see at a glance at any moment:

- **Active model** — which version of Claude the current session is using
- **Context bar** — a visual representation of how much context I have consumed
- **Current tokens over the maximum** — for example, <span class="high">87k/200k</span>, which tells me exactly where I am in the window
- **5h and 7d usage with reset time** — to know whether I am approaching a rate limit and when it frees up
- **Effort level** — visual confirmation that the session has the right level configured
- **Git branch** — which branch I am working on in the active project

What I value most is that this information **costs nothing**. It is not a question to the AI, not a command I have to remember to run, not an extra window to open. It is text that appears, updates on its own, and fades from focus as soon as I get to work.

The approach also fits well with what I explored in [Back to Shell](/blog/back-to-shell/): the shell as a space for composition, where scripts do the deterministic work and the AI does the contextual work. The status bar is the most visible example of that separation — all the formatting and color logic lives in the script, and the AI has no idea it exists.

If you work with <span class="high">Claude Code</span> and have information you check repeatedly, the <span class="high">statusLine</span> is the most efficient way to keep it always at hand. The script can show whatever you need: external API usage, the status of a service, environment variables, anything you want to expose from a shell command.

**Keep coding, keep running** 🏃‍♂️

---
