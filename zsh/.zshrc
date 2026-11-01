# Загружает систему автодополнения zsh
autoload -Uz compinit && compinit

# Вставка \ перед ? " " и тп
DISABLE_MAGIC_FUNCTIONS=true

# Настройки истории
export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILE=$ZDOTDIR/.zsh_history


# Создаем директорию, если ее нет
if [ ! -d "$ZDOTDIR/zshrc.d" ]; then
  mkdir -p "$ZDOTDIR/zshrc.d"
fi



# Path для neovim tools
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# asdf shims — ПОСЛЕ homebrew, чтобы перекрыть brew node
export ASDF_DATA_DIR="${ASDF_DATA_DIR:-$HOME/.asdf}"
export PATH="$ASDF_DATA_DIR/shims:$PATH"

# Подключаем вспомогательные файлы
for src in $ZDOTDIR/zshrc.d/*.zsh; do
  . "$src"
done

# kubectl completion
source <(kubectl completion zsh)

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'


# pnpm
export PNPM_HOME="/Users/dyuzha/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end
