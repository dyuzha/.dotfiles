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
