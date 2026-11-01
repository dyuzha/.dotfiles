if ! (( $+functions[zsh-defer] )); then
  fpath+=( "$HOME/Library/Caches/antidote/github.com/romkatv/zsh-defer" )
  source "$HOME/Library/Caches/antidote/github.com/romkatv/zsh-defer/zsh-defer.plugin.zsh"
fi
fpath+=( "$HOME/Library/Caches/antidote/github.com/zsh-users/zsh-autosuggestions" )
zsh-defer source "$HOME/Library/Caches/antidote/github.com/zsh-users/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/github.com/zsh-users/zsh-completions" )
zsh-defer source "$HOME/Library/Caches/antidote/github.com/zsh-users/zsh-completions/zsh-completions.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/github.com/zdharma-continuum/fast-syntax-highlighting" )
zsh-defer source "$HOME/Library/Caches/antidote/github.com/zdharma-continuum/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/github.com/hlissner/zsh-autopair" )
source "$HOME/Library/Caches/antidote/github.com/hlissner/zsh-autopair/zsh-autopair.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/github.com/ohmyzsh/ohmyzsh/plugins/colored-man-pages" )
zsh-defer source "$HOME/Library/Caches/antidote/github.com/ohmyzsh/ohmyzsh/plugins/colored-man-pages/colored-man-pages.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/github.com/ohmyzsh/ohmyzsh/plugins/colorize" )
zsh-defer source "$HOME/Library/Caches/antidote/github.com/ohmyzsh/ohmyzsh/plugins/colorize/colorize.plugin.zsh"
source "$HOME/Library/Caches/antidote/github.com/ohmyzsh/ohmyzsh/themes/refined.zsh-theme"
