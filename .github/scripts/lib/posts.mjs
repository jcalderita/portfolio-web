// Shared detection + frontmatter parsing for the social announcers
// (publish-x.mjs, publish-linkedin.mjs). Zero dependencies — native fs only.

import { readdirSync, readFileSync } from 'node:fs'

const LOCALES = ['es', 'en']

// Minimal frontmatter parser: splits on the first `---` fence pair, reads
// `key: value` lines, and returns the body after the fence (for excerpts).
export function parseFrontmatter(content) {
  const fields = {}
  const lines = content.split('\n')
  let inside = false
  let endLine = -1
  for (let i = 0; i < lines.length; i++) {
    if (lines[i].trim() === '---') {
      if (inside) {
        endLine = i
        break
      }
      inside = true
      continue
    }
    if (!inside) continue
    const colon = lines[i].indexOf(':')
    if (colon === -1) continue
    fields[lines[i].slice(0, colon).trim()] = lines[i].slice(colon + 1).trim()
  }
  const body = endLine === -1 ? '' : lines.slice(endLine + 1).join('\n')
  return { fields, body }
}

// Posts whose frontmatter `date` equals today (YYYY-MM-DD) and `publish: true`.
// One entry per language file, so a bilingual post yields two.
export function detectTodaysPosts(today) {
  const posts = []
  for (const locale of LOCALES) {
    const dir = `content/${locale}/blog`
    for (const file of readdirSync(dir)) {
      if (!file.endsWith('.md')) continue
      const { fields, body } = parseFrontmatter(readFileSync(`${dir}/${file}`, 'utf8'))
      if (fields.publish !== 'true' || fields.date !== today || !fields.slug) continue
      posts.push({ locale, fields, body })
    }
  }
  return posts
}

// Today's date in Madrid as YYYY-MM-DD. `en-CA` is the ISO-8601 locale, so this
// is a string comparison against frontmatter `date`, dodging midnight/offset bugs.
export function todayInMadrid() {
  return new Date().toLocaleDateString('en-CA', { timeZone: 'Europe/Madrid' })
}

export function hashtags(tagsField) {
  return (tagsField ?? '')
    .split(',')
    .map((tag) => tag.trim())
    .filter(Boolean)
    .map((tag) => `#${tag}`)
    .join(' ')
}

export function blogPath(locale, slug) {
  return locale === 'es' ? `/es/blog/${slug}/` : `/blog/${slug}/`
}
