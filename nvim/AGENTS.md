# AGENTS.md — Neovim config

Личный конфиг Neovim (v0.12+, macOS). Плагин-менеджер — lazy.nvim,
версии закреплены в `lazy-lock.json` (не править вручную).

## Структура

- `init.lua` → `lua/core/*` — база, грузится всегда: опции (`configs.lua`),
  кеймапы (`mappings.lua`, leader = Space), автокоманды, bootstrap lazy.nvim (`plugins.lua`)
- `lua/plugins/<категория>/` — спеки плагинов, один плагин = один файл.
  Категории: `lsp/` (LSP, conform, cmp, treesitter), `ide/` (UI/редактор),
  `obs/` (markdown/заметки). `dev/` — самописные плагины, импорт отключён.
- `lua/env.lua` — машинно-зависимые пути
- `ftplugin/`, `after/ftplugin/`, `ftdetect/` — настройки по файтайпам

## Соглашения

- Новая спека плагина — файл в `lua/plugins/<категория>/`, возвращающий
  таблицу lazy.nvim. Подхватывается автоматически через `import`,
  `core/plugins.lua` трогать не нужно.
- LSP настраивается через `vim.lsp.config()` / `vim.lsp.enable()` (API 0.11+)
  в `lua/plugins/lsp/lspconfig.lua`; серверы ставятся mason'ом
  (`ensure_installed`). LSP-кеймапы — в `on_attach` там же.
- Глобальные кеймапы — в `lua/core/mappings.lua`; кеймапы плагина — в его спеке.
- Форматирование — через conform, не через LSP.
- Комментарии в конфиге — на русском.
- Кастомные файтайпы (systemd, yaml.ansible, helm, yaml_gitlab, mermaid) объявлены в
  `core/configs.lua` и `lsp/lspconfig.lua` — паттерны согласованы с
  treesitter-регистрацией, менять вместе.

## Проверка изменений

Конфиг должен стартовать без ошибок:

```bash
nvim --headless '+qa!' 2>&1   # пустой вывод = ок
```
