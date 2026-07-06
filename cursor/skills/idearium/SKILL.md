---
name: idearium
description: >-
  Captures, stores, and searches personal ideas in ~/.idearium (Idearium).
  Use when the user mentions idearium, ideynik, ideynik, adding an idea,
  recording a thought, idea inbox, or asks to save something for later
  from any project or chat.
---

# Idearium (Идеариум)

Personal idea storage at `~/.idearium/`. One markdown file per idea.

## Paths

| Path | Purpose |
|------|---------|
| `~/.idearium/ideas/YYYY/YYYY-MM-DD-slug.md` | Idea files |
| `~/.idearium/_template.md` | Template |
| `~/.idearium/TAGS.md` | Approved tag vocabulary |
| `~/.cursor/skills/idearium/scripts/new-idea-path.sh` | Resolve file path |

If `~/.idearium/` is missing, create README, TAGS, template, and `ideas/` first.

## Add idea workflow

1. Extract **title**, optional **tags**, and body from the user message.
2. If title is unclear, ask **one** short question — do not block on other fields.
3. Build **slug**: lowercase latin, hyphens; transliterate or paraphrase Cyrillic.
4. Resolve path: `bash ~/.cursor/skills/idearium/scripts/new-idea-path.sh SLUG`
5. Fill frontmatter from `_template.md`:
   - `id`: `{date}-{slug}`
   - `created`: ISO 8601 local time
   - `status`: `inbox` (unless user specifies)
   - `source.project`: current workspace folder name if available
   - `source.chat_hint`: one line on where the idea came from
6. Write **Суть** from the user text; **Контекст** — 2–4 sentences from chat if relevant.
7. **Tags** — see Tag rules below; read `TAGS.md` before writing.
8. Write the file. Reply with path, title, status, and tags.
9. If any tag is not in `TAGS.md`, add a **Новые:** line and **stop for approval**. Do not add new tags to approved sections until the user confirms.
10. On approval: move tags from «Ожидают утверждения» into the right section in `TAGS.md`.

### Response format

All tags known:

```
Записал: ~/.idearium/ideas/2026/2026-06-27-slug.md
Теги: recall, feature
```

New tags present — no markers on existing tags:

```
Записал: ~/.idearium/ideas/2026/2026-06-27-slug.md
Теги: recall, cli, feature

Новые: cli

Добавить в словарь? (да / нет / замени на ...)
```

Never use `(OK)` or «в словаре» for known tags.

## Tag rules

Flat tags only: `recall`, `python`, `feature` — not `project/recall`.

| Rule | Example |
|------|---------|
| lowercase latin | `mvp`, `cli` |
| hyphen for compounds | `spec-kit` |
| no spaces, `_`, `#` | bad: `Side Project` |
| dedupe | `[recall, recall]` → `[recall]` |
| 2–6 tags per idea | keep search usable |

**Auto-tags when user does not specify:**

- workspace name → tag (e.g. `recall`)
- 1–2 topic tags from idea text
- 1 type tag if it fits: `feature`, `refactor`, `tool`, `workflow`, `learning`, `architecture`, `testing`, `meta`

**User-specified:** use after normalization (`теги: cli, mvp`).

**Pending tags:** write to idea file immediately; add to `TAGS.md` «Ожидают утверждения» only after showing **Новые:**; move to approved sections after user OK.

## Search workflow

| User asks | Action |
|-----------|--------|
| ideas about X | `grep -rl "X" ~/.idearium/ideas` or grep `tags:` block |
| tag recall + architecture | files containing both tags in frontmatter |
| show tag dictionary | Read `~/.idearium/TAGS.md` |

List results: title, path, status, tags — newest first if sortable by date in filename.

## Update status

User: «идею deck-repetitions — exploring» → find file by slug/id grep, StrReplace `status` in frontmatter.

## Approve tags workflow

User says «да» → for each new tag, pick section (Проекты / Типы / Темы), append to that line, remove from «Ожидают утверждения».

User says «нет» or replaces tag → update idea file tags and `TAGS.md` accordingly.
