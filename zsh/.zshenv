# Global Varible
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"


# Порядок предпочтений для базовых каталогов, в которых
# будет произведен поиск конфигурационных файлов (в дополнении к
# $XDG_CONFIG_HOME)
# export XDG_CONFIG_DIRS=

# export XDG_RUNTIME_DIR=/run/user/1000

export ZDOTDIR="$HOME/.config/zsh"

typeset -U path fpath
path=(~/.local/bin ~/bin $path)
fpath+=("$ZDOTDIR/.zfunc")
