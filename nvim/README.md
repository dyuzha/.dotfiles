## Зависимости
---

- [Node.js](https://nodejs.org/en/download/package-manager)

- Python

- [ripgrep](https://github.com/BurntSushi/ripgrep) - Можно через pm

- [lasy.git](https://github.com/jesseduffield/lazygit)

- [bottom](https://github.com/ClementTsang/bottom?tab=readme-ov-file)

- [gdu](Tree-sitter CLI)

- [Tree-sitter CLI](https://github.com/tree-sitter/tree-sitter/blob/master/cli/README.md)

- fd-find (для venv-selector)

## Настройка персонализированных переменных
---
```lua
-- nvim/lua/env.lua
local M = {}

-- Пути (пример для Linux/macOS/Windows)
M.paths = {
  shell = "/bin/bash"
}

return M
```

