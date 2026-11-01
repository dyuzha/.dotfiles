---
name: genesis-init
description: Раскладывает правила и пустые шаблоны в текущий репозиторий. Вызывай только когда пользователь пишет /genesis-init.
disable-model-invocation: true
---

# /genesis-init

Инициализируй репозиторий, который сейчас открыт. Это любой проект, не специальная папка. Рассказ не пиши. Папку ролика не создавай.

## Откуда копировать

Канонические файлы лежат рядом с этим навыком:

`~/.cursor/skills/genesis-init/assets/rules/`
`~/.cursor/skills/genesis-init/assets/templates/`

Если этого каталога нет, остановись и напиши, что глобальный навык установлен не полностью. Схему с нуля не выдумывай.

## Что сделать

Корень — корень открытого репозитория.

1. `reels/` и другие каталоги под идею не создавай. README репозитория не трогай.
2. Скопируй в `rules/` только те файлы из assets, которых ещё нет: `00-shared.md`, `01-story.md`, `02-screenplay.md`, `03-briefs.md`, `04-nauchpop.md`. Существующие не затирай.
3. Скопируй в `templates/` только отсутствующие `story.md`, `screenplay.md`, `briefs.md`, `source.md`. Существующие не затирай.
4. Если в корне нет `story.md`, `screenplay.md`, `briefs.md` или `source.md`, создай недостающие копией одноимённого файла из `templates/`.
5. Если в сообщении есть «сбросить» или `reset`, замени корневые `story.md`, `screenplay.md`, `briefs.md` и `source.md` копиями из `templates/`. `rules/` и `templates/` при сбросе не трогай.

## Ответ

Напиши корень репозитория и какие файлы созданы, а какие уже были. Дальше:

- `/genesis-source` и ссылка, путь или текст — заполнит `source.md`
- `/genesis-idea` и мысль — заполнит `story.md`. Без мысли угол берётся из заполненного `source.md`
- `/genesis-screenplay` — заполнит `screenplay.md` из `story.md`
- `/genesis-briefs` — заполнит `briefs.md` из `screenplay.md`
