#!/usr/bin/env node
// Announce the day's blog posts on LinkedIn via the Make.com webhook.
//
// Same detection as publish-x.mjs (lib/posts.mjs): every post dated today
// (Europe/Madrid) with `publish: true`, one post per language. Sends Make the
// same payload the old Swift script did — { text, url, title, thumbnail } —
// and Make's scenario (Custom webhook -> Create a post) publishes it; LinkedIn
// renders the rich card from the page's Open Graph tags. Pass --dry-run to
// print the payload without POSTing.

import { detectTodaysPosts, todayInMadrid, hashtags, blogPath } from './lib/posts.mjs'

const DRY_RUN = process.argv.includes('--dry-run')

const today = todayInMadrid()

// MARK: - Excerpt (port of the Swift extractExcerpt — 80 words, markdown stripped)

function extractExcerpt(body, wordCount = 80) {
  let text = body
  text = text.replace(/<span[^>]*>|<\/span>/g, '')
  text = text.replace(/\[([^\]]+)\]\([^)]+\)/g, '$1')
  text = text.replace(/^#{1,6}\s+.*$/gm, '')
  text = text.replace(/^---$/gm, '')
  text = text.replace(/```[\s\S]*?```/g, '')
  text = text.replace(/``[^`]+``/g, '')
  text = text.replace(/\*\*([^*]+)\*\*/g, '$1')
  text = text.replace(/`([^`]+)`/g, '$1')
  text = text.replace(/\|[^\n]+\|/g, '')
  text = text.replace(/^>\s*/gm, '')
  text = text.replace(/^\d+\.\s+/gm, '')
  text = text.replace(/\n{2,}/g, '\n')

  const words = text.split(/\s+/).filter(Boolean)
  if (words.length > wordCount) return `${words.slice(0, wordCount).join(' ')}...`
  return words.join(' ')
}

function composePost({ fields, body, locale }) {
  return {
    locale,
    slug: fields.slug,
    text: `${fields.description ?? ''}\n\n${extractExcerpt(body)}\n\n${hashtags(fields.tags)}`,
    url: `https://jcalderita.com${blogPath(locale, fields.slug)}`,
    title: `${fields.title ?? ''}: ${fields.description ?? ''}`,
    thumbnail: `https://jcalderita.com/static/blog/${fields.cover}.webp`,
  }
}

// MARK: - Cover polling

// LinkedIn builds the card from OG tags the moment Make posts, so make sure the
// cover has propagated to Cloudflare first. Best-effort; proceeds after retries.
async function waitForCovers(urls, retries = 10, intervalMs = 5000) {
  for (const url of new Set(urls)) {
    for (let attempt = 1; attempt <= retries; attempt++) {
      try {
        const response = await fetch(url, { method: 'HEAD' })
        if (response.ok) {
          console.log(`Cover available: ${url} (attempt ${attempt})`)
          break
        }
      } catch {
        // network hiccup — fall through to retry
      }
      if (attempt < retries) {
        console.log(`Cover not ready: ${url} (attempt ${attempt}, retrying in ${intervalMs / 1000}s...)`)
        await new Promise((resolve) => setTimeout(resolve, intervalMs))
      } else {
        console.log(`Cover not available after ${retries} attempts: ${url}, proceeding anyway`)
      }
    }
  }
}

// MARK: - LinkedIn via Make.com webhook

async function postToLinkedIn(post, webhookURL) {
  const tag = `[${post.locale.toUpperCase()}]`
  try {
    const response = await fetch(webhookURL, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        text: post.text,
        url: post.url,
        title: post.title,
        thumbnail: post.thumbnail,
      }),
    })

    if (!response.ok) {
      console.log(`  ${tag} LinkedIn error ${response.status}: ${await response.text()}`)
      return false
    }

    console.log(`  ${tag} LinkedIn post sent via webhook`)
    return true
  } catch (error) {
    console.log(`  ${tag} LinkedIn request failed: ${error.message}`)
    return false
  }
}

// MARK: - Main

const posts = detectTodaysPosts(today).map(composePost)

if (posts.length === 0) {
  console.log(`No posts dated ${today} — nothing to announce on LinkedIn`)
  process.exit(0)
}

for (const post of posts) {
  console.log(`[LinkedIn] [${post.locale.toUpperCase()}] ${post.slug}`)
}

if (DRY_RUN) {
  for (const post of posts) {
    console.log(`\n--- ${post.locale.toUpperCase()} ${post.slug} ---`)
    console.log(JSON.stringify(post, null, 2))
  }
  process.exit(0)
}

const webhookURL = process.env.MAKE_WEBHOOK_URL
if (!webhookURL) {
  console.log('MAKE_WEBHOOK_URL not set — skipping LinkedIn')
  process.exit(0)
}

await waitForCovers(posts.map((post) => post.thumbnail))

for (const post of posts) {
  if (!(await postToLinkedIn(post, webhookURL))) {
    console.log(`  Failed: [LinkedIn] [${post.locale.toUpperCase()}] ${post.slug}`)
  }
}

console.log('\n[LinkedIn] Done')
