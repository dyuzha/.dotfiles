# Base
source $HOME/.dotfiles/.aliases

# Загружает систему автодополнения zsh
autoload -Uz compinit && compinit

# Путь до директории с плагинами Oh My Zsh
export ZSH="${ZDOTDIR}/oh-my-zsh"

# Вставка \ перед ? " " и тп
DISABLE_MAGIC_FUNCTIONS=true


# ANTIDOTE
antidote_zsh="$ZDOTDIR/.antidote/antidote.zsh"

if [ -f "$antidote_zsh" ]; then
    zsh_plugins=${ZDOTDIR}/.zsh_plugins

  # Является ли файл .zsh более новым, чем файл .txt в каталоге zsh_plugins. Если нет, то выполняется код внутри скобок.
    if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
    (
        source "$antidote_zsh"
        # Создаётся новый файл .zsh с помощью команды antidote bundle.
        antidote bundle <${zsh_plugins}.txt >${zsh_plugins}.zsh
    )
  fi

  # В конце этот код загружает новый файл плагинов .zsh.
  source ${zsh_plugins}.zsh
fi


# Настройки истории
export HISTSIZE=100000
export SAVEHIST=100000

# Файл истории так же храним в ~/.config/zsh
export HISTFILE=$ZDOTDIR/.zsh_history

## Всякие алиасы я предпочитаю хранить как файлы с расширением `.zsh` в ~/.config/zsh/zshrc.d
#
# # Тут мы создаем директорию, если ее нет
# if [ ! -d "$ZDOTDIR/zshrc.d" ]; then
#   mkdir -p "$ZDOTDIR/zshrc.d"
# fi
#
# # А тут: подключаем вспомогательные файлы
# for src in $ZDOTDIR/zshrc.d/*.zsh; do
#   . "$src"
# done


# Zoxide
eval "$(zoxide init zsh)"
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"


# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# YC
# The next line updates PATH for CLI.
if [ -f '/home/dyuzha/yandex-cloud/path.bash.inc' ]; then source '/home/dyuzha/yandex-cloud/path.bash.inc'; fi

# The next line enables shell command completion for yc.
if [ -f '/home/dyuzha/yandex-cloud/completion.zsh.inc' ]; then source '/home/dyuzha/yandex-cloud/completion.zsh.inc'; fi


