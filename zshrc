# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load the Antibody plugin manager for zsh.
source <(antibody init)

# Setup required env var for oh-my-zsh plugins
export ZSH=$(antibody path ohmyzsh/ohmyzsh)

antibody bundle lukechilds/zsh-nvm
antibody bundle ohmyzsh/ohmyzsh
antibody bundle ohmyzsh/ohmyzsh path:plugins/cp
antibody bundle ohmyzsh/ohmyzsh path:plugins/git
antibody bundle ohmyzsh/ohmyzsh path:plugins/npm
antibody bundle ohmyzsh/ohmyzsh path:plugins/aws
antibody bundle romkatv/powerlevel10k
antibody bundle dracula/zsh
antibody bundle zsh-users/zsh-autosuggestions

# unique history per terminal
unsetopt inc_append_history
unsetopt share_history

# put cursor at beginning of line when navigating history
bindkey -a j vi-down-line-or-history
bindkey -a k vi-up-line-or-history

alias less='less -r'
alias ls='gls --classify --color'
alias ll='gls -lhtr --classify --color'
alias grep='grep --color'
alias ack='ag'
alias vim='nvim'
alias kitty='kitty -o allow_remote_control=yes --single-instance --listen-on unix:/tmp/mykitty'

# Truleo
alias leads='cd ~/code/truleo/leads'
alias client='cd ~/code/truleo/leads/client'
alias server='cd ~/code/truleo/leads/server'
alias sl='npm run server:lint'
alias st='npm run server:test'
alias slt='npm run server:lint && npm run server:test'
alias cl='npm run client:lint'
alias ct='npm run client:test'
alias ctw='npm run client:test:watch'
alias clt='npm run client:lint && npm run client:test'

# Dev envs
alias kube-corey='kubectl --context=arn:aws-us-gov:eks:us-gov-west-1:330390204086:cluster/truleo-dev --namespace=truleo-corey'
alias stern-corey='stern --context=arn:aws-us-gov:eks:us-gov-west-1:330390204086:cluster/truleo-dev --namespace=truleo-corey'
alias kube-corey-debug='kubectl --context=arn:aws-us-gov:eks:us-gov-west-1:330390204086:cluster/truleo-dev --namespace=truleo-corey exec -c leads-debug leads-debug-0 -ti -- sh'
alias kube-corey-pg='kubectl --context=arn:aws-us-gov:eks:us-gov-west-1:330390204086:cluster/truleo-dev --namespace=truleo-corey exec -c leads-debug leads-debug-0 -ti -- pg'
alias kube-corey-pgdump='kubectl --context=arn:aws-us-gov:eks:us-gov-west-1:330390204086:cluster/truleo-dev --namespace=truleo-corey exec -c leads-debug leads-debug-0 -- sh -c "pg_dump -d \$DATABASE_CONNECTION_STRING --exclude-table-data public.speaker_fingerprints --no-blobs | gzip"'

alias kube-brendan='kubectl --context=arn:aws-us-gov:eks:us-gov-west-1:330390204086:cluster/truleo-dev --namespace=truleo-brendan'
alias stern-brendan='stern --context=arn:aws-us-gov:eks:us-gov-west-1:330390204086:cluster/truleo-dev --namespace=truleo-brendan'
alias kube-brendan-debug='kubectl --context=arn:aws-us-gov:eks:us-gov-west-1:330390204086:cluster/truleo-dev --namespace=truleo-brendan exec -c leads-debug leads-debug-0 -ti -- sh'
alias kube-brendan-pg='kubectl --context=arn:aws-us-gov:eks:us-gov-west-1:330390204086:cluster/truleo-dev --namespace=truleo-brendan exec -c leads-debug leads-debug-0 -ti -- pg'
alias kube-brendan-pgdump='kubectl --context=arn:aws-us-gov:eks:us-gov-west-1:330390204086:cluster/truleo-dev --namespace=truleo-brendan exec -c leads-debug leads-debug-0 -- sh -c "pg_dump -d \$DATABASE_CONNECTION_STRING --exclude-table-data public.speaker_fingerprints --no-blobs | gzip"'

alias kube-deep='kubectl --context=arn:aws-us-gov:eks:us-gov-west-1:330390204086:cluster/truleo-dev --namespace=truleo-deepsearch'
alias stern-deep='stern --context=arn:aws-us-gov:eks:us-gov-west-1:330390204086:cluster/truleo-dev --namespace=truleo-deepsearch'
alias kube-deep-debug='kubectl --context=arn:aws-us-gov:eks:us-gov-west-1:330390204086:cluster/truleo-dev --namespace=truleo-deepsearch exec -c leads-debug leads-debug-0 -ti -- bash'
alias kube-deep-pg='kubectl --context=arn:aws-us-gov:eks:us-gov-west-1:330390204086:cluster/truleo-dev --namespace=truleo-deepsearch exec -c leads-debug leads-debug-0 -ti -- pg'
alias kube-deep-pgdump='kubectl --context=arn:aws-us-gov:eks:us-gov-west-1:330390204086:cluster/truleo-dev --namespace=truleo-deepsearch exec -c leads-debug leads-debug-0 -- sh -c "pg_dump -d \$DATABASE_CONNECTION_STRING --exclude-table-data public.speaker_fingerprints --no-blobs | gzip"'

alias kube-pgupgrade='kubectl --context=arn:aws-us-gov:eks:us-gov-west-1:330390204086:cluster/truleo-dev --namespace=truleo-pgupgrade'
alias stern-pgupgrade='stern --context=arn:aws-us-gov:eks:us-gov-west-1:330390204086:cluster/truleo-dev --namespace=truleo-pgupgrade'
alias kube-pgupgrade-debug='kubectl --context=arn:aws-us-gov:eks:us-gov-west-1:330390204086:cluster/truleo-dev --namespace=truleo-pgupgrade exec -c leads-debug leads-debug-0 -ti -- bash'
alias kube-pgupgrade-pg='kubectl --context=arn:aws-us-gov:eks:us-gov-west-1:330390204086:cluster/truleo-dev --namespace=truleo-pgupgrade exec -c leads-debug leads-debug-0 -ti -- pg'
alias kube-pgupgrade-pgdump='kubectl --context=arn:aws-us-gov:eks:us-gov-west-1:330390204086:cluster/truleo-dev --namespace=truleo-pgupgrade exec -c leads-debug leads-debug-0 -- sh -c "pg_dump -d \$DATABASE_CONNECTION_STRING --exclude-table-data public.speaker_fingerprints --no-blobs | gzip"'

# Staging Envs
alias kube-uat='kubectl --context=arn:aws-us-gov:eks:us-gov-west-1:181734793061:cluster/truleo-stage --namespace=truleo-staging-uat'
alias stern-uat='stern --context=arn:aws-us-gov:eks:us-gov-west-1:181734793061:cluster/truleo-stage --namespace=truleo-staging-uat'
alias kube-uat-debug='kubectl --context=arn:aws-us-gov:eks:us-gov-west-1:181734793061:cluster/truleo-stage --namespace=truleo-staging-uat exec -c leads-debug leads-debug-0 -ti -- sh'
alias kube-uat-pg='kubectl --context=arn:aws-us-gov:eks:us-gov-west-1:181734793061:cluster/truleo-stage --namespace=truleo-staging-uat exec -c leads-debug leads-debug-0 -ti -- pg'
alias kube-uat-pgdump='kubectl --context=arn:aws-us-gov:eks:us-gov-west-1:181734793061:cluster/truleo-stage --namespace=truleo-staging-uat exec -c leads-debug leads-debug-0 -- sh -c "pg_dump -d \$DATABASE_CONNECTION_STRING --exclude-table-data public.speaker_fingerprints --no-blobs | gzip"'

# Production Env
alias kube-prod='kubectl --context=arn:aws-us-gov:eks:us-gov-west-1:209603608981:cluster/truleo-prod --namespace=truleo-prod'
alias stern-prod='stern --context=arn:aws-us-gov:eks:us-gov-west-1:209603608981:cluster/truleo-prod --namespace=truleo-prod'
alias kube-prod-debug='kubectl --context=arn:aws-us-gov:eks:us-gov-west-1:209603608981:cluster/truleo-prod --namespace=truleo-prod exec -c leads-debug leads-debug-0 -ti -- sh'
alias kube-prod-pg='kubectl --context=arn:aws-us-gov:eks:us-gov-west-1:209603608981:cluster/truleo-prod --namespace=truleo-prod exec -c leads-debug leads-debug-0 -ti -- pg'
alias kube-prod-pgdump='kubectl --context=arn:aws-us-gov:eks:us-gov-west-1:209603608981:cluster/truleo-prod --namespace=truleo-prod exec -c leads-debug leads-debug-0 -- sh -c "pg_dump -d \$DATABASE_CONNECTION_STRING --exclude-table-data public.speaker_fingerprints --no-blobs | gzip"'

# Buildkite
alias kube-buildkite='kubectl -n buildkite --context ops'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set vi edit mode
bindkey -v
# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# bun completions
[ -s "/Users/corey/.bun/_bun" ] && source "/Users/corey/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
