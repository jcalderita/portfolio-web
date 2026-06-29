#!/usr/bin/env node
// Announce the day's blog posts on X (Twitter) via OAuth 1.0a.
//
// Detection is shared with publish-linkedin.mjs (lib/posts.mjs): every post
// whose frontmatter `date` equals today (Europe/Madrid) and is `publish: true`
// gets one tweet per language. Run by the weekly cron in deploy.yml, so a post
// is announced exactly once — on the rebuild that first makes it live. Pass
// --dry-run to print the tweet text and Authorization header without POSTing.

import { createHmac, randomUUID } from 'node:crypto'
import { detectTodaysPosts, todayInMadrid, hashtags, blogPath } from './lib/posts.mjs'

const DRY_RUN = process.argv.includes('--dry-run')
const ENDPOINT = 'https://api.x.com/2/tweets'

const today = todayInMadrid()

function composeText({ fields, locale }) {
  const url = `jcalderita.com${blogPath(locale, fields.slug)}`
  return `${fields.description ?? ''}\n\n${url}\n\n${hashtags(fields.tags)}`
}

// MARK: - OAuth 1.0a

function requireEnv(key) {
  const value = process.env[key]
  if (!value) throw new Error(`Missing environment variable: ${key}`)
  return value
}

function percentEncode(value) {
  return encodeURIComponent(value).replace(
    /[!*'()]/g,
    (char) => `%${char.charCodeAt(0).toString(16).toUpperCase()}`,
  )
}

function authorizationHeader(url, method = 'POST') {
  const params = [
    ['oauth_consumer_key', requireEnv('X_API_KEY')],
    ['oauth_nonce', randomUUID().replaceAll('-', '')],
    ['oauth_signature_method', 'HMAC-SHA1'],
    ['oauth_timestamp', `${Math.floor(Date.now() / 1000)}`],
    ['oauth_token', requireEnv('X_ACCESS_TOKEN')],
    ['oauth_version', '1.0'],
  ]

  const paramString = [...params]
    .sort(([a], [b]) => a.localeCompare(b))
    .map(([key, value]) => `${percentEncode(key)}=${percentEncode(value)}`)
    .join('&')

  const baseString = [method, percentEncode(url), percentEncode(paramString)].join('&')
  const signingKey = [
    percentEncode(requireEnv('X_API_SECRET')),
    percentEncode(requireEnv('X_ACCESS_TOKEN_SECRET')),
  ].join('&')
  const signature = createHmac('sha1', signingKey).update(baseString).digest('base64')

  return 'OAuth ' + [...params, ['oauth_signature', signature]]
    .sort(([a], [b]) => a.localeCompare(b))
    .map(([key, value]) => `${key}="${percentEncode(value)}"`)
    .join(', ')
}

// MARK: - X API

async function postToX(post) {
  const tag = `[${post.locale.toUpperCase()}]`
  try {
    const response = await fetch(ENDPOINT, {
      method: 'POST',
      headers: {
        Authorization: authorizationHeader(ENDPOINT),
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ text: post.text }),
    })

    if (!response.ok) {
      console.log(`  ${tag} Error ${response.status}: ${await response.text()}`)
      return false
    }

    const json = await response.json().catch(() => null)
    if (json?.data?.id) console.log(`  ${tag} Tweet posted: id=${json.data.id}`)
    return true
  } catch (error) {
    console.log(`  ${tag} Request failed: ${error.message}`)
    return false
  }
}

// MARK: - Main

const posts = detectTodaysPosts(today).map((post) => ({
  locale: post.locale,
  slug: post.fields.slug,
  text: composeText(post),
}))

if (posts.length === 0) {
  console.log(`No posts dated ${today} — nothing to announce on X`)
  process.exit(0)
}

for (const post of posts) {
  console.log(`[X] [${post.locale.toUpperCase()}] ${post.slug} (${post.text.length} chars)`)
}

if (DRY_RUN) {
  for (const post of posts) {
    console.log(`\n--- ${post.locale.toUpperCase()} ${post.slug} ---`)
    console.log(post.text)
    try {
      console.log(`\nAuthorization: ${authorizationHeader(ENDPOINT)}`)
    } catch (error) {
      console.log(`\n(Authorization header skipped: ${error.message})`)
    }
  }
  process.exit(0)
}

for (const post of posts) {
  if (!(await postToX(post))) {
    console.log(`  Failed: [X] [${post.locale.toUpperCase()}] ${post.slug}`)
  }
}

console.log('\n[X] Done')
