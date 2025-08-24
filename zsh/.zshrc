# Загружает систему автодополнения zsh
autoload -Uz compinit && compinit

# Путь до директории с плагинами Oh My Zsh
# export ZSH="${ZDOTDIR}/oh-my-zsh"

# Вставка \ перед ? " " и тп
DISABLE_MAGIC_FUNCTIONS=true

# Настройки истории
export HISTSIZE=100000
export SAVEHIST=100000

# Файл истории так же храним в ~/.config/zsh
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

export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
