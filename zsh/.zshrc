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

# Подключаем вспомогательные файлы
for src in $ZDOTDIR/zshrc.d/*.zsh; do
  . "$src"
done

# Подкючаем asdf
. /usr/local/Cellar/asdf/0.17.0/libexec/asdf.sh

# Path для neovim tools
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"

# kubectl completion
source <(kubectl completion zsh)

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
