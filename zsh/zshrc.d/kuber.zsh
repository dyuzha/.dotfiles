# alias k=kubectl
# alias kgp='kubectl get pods'
# alias kgn='kubectl get nodes'
# alias kgs='kubectl get svc'
# alias kd='kubectl describe'
#
# alias kctx='kubectl config get-contexts'
# alias kus='kubectl config use-context'
#
# function kube_context() {
#   kubectl config current-context 2>/dev/null
# }
#
# function kube_namespace() {
#   kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null
# }
#
# function git_branch() {
#   git rev-parse --abbrev-ref HEAD 2>/dev/null
# }
#
# set_prompt() {
#   local kube="$(kube_context)"
#   local ns="$(kube_namespace)"
#   local git="$(git_branch)"
#
#   local color="cyan"
#
#   # kube-based coloring
#   if [[ "$kube" == "prod" ]]; then
#     color="red"
#   fi
#
#   PROMPT="%F{$color}${kube}%f"
#
#   [[ -n $ns ]] && PROMPT+=":%F{yellow}${ns}%f"
#   [[ -n $git ]] && PROMPT+=" %F{green}git:(${git})%f"
#
#   PROMPT+=" ➜ "
# }
#
# precmd() {
#   set_prompt
# }
