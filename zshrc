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

alias kube-testing='kubectl --context=arn:aws-us-gov:eks:us-gov-west-1:330390204086:cluster/truleo-dev --namespace=truleo-dev-testing'
alias kube-testing-debug='kubectl --context=arn:aws-us-gov:eks:us-gov-west-1:330390204086:cluster/truleo-dev --namespace=truleo-dev-testing exec -c leads-debug leads-debug-0 -ti -- sh'
alias kube-testing-pg='kubectl --context=arn:aws-us-gov:eks:us-gov-west-1:330390204086:cluster/truleo-dev --namespace=truleo-dev-testing exec -c leads-debug leads-debug-0 -ti -- pg'

alias kube-s='kubectl --context=staging --namespace=truleo'
alias stern-s='stern --context=staging --namespace=truleo'
alias kube-s-debug='kubectl --context=staging  --namespace=truleo exec -c leads-debug leads-debug-0 -ti -- sh'
alias kube-s-pg='kubectl --context=staging --namespace=truleo exec -c leads-debug leads-debug-0 -ti -- pg'
alias kube-s-pgdump='kubectl --context=staging --namespace=truleo exec -c leads-debug leads-debug-0 -- sh -c "pg_dump -h \$DATABASE_HOST -U \$DATABASE_USER -d \$DATABASE_DBNAME | gzip"'

alias kube-demo='kubectl --context=staging --namespace=truleo-demo'
alias stern-demo='stern --context=staging --namespace=truleo-demo'
alias kube-demo-debug='kubectl --context=staging --namespace=truleo-demo exec -c leads-debug leads-debug-0 -ti -- sh'
alias kube-demo-pg='kubectl --context=staging --namespace=truleo-demo exec -c leads-debug leads-debug-0 -ti -- pg'
alias kube-demo-pgdump='kubectl --context=staging --namespace=truleo-demo exec -c leads-debug leads-debug-0 -- sh -c "pg_dump -h \$DATABASE_HOST -U \$DATABASE_USER -d \$DATABASE_DBNAME --exclude-table-data public.waveforms --exclude-table-data public.officer_audio_samples --exclude-table-data public.officer_audio_sample_segments --exclude-table-data public.speaker_fingerprints --no-blobs | gzip"'

alias kube-uat='kubectl --context=staging --namespace=truleo-uat'
alias stern-uat='stern --context=staging --namespace=truleo-uat'
alias kube-uat-debug='kubectl --context=staging --namespace=truleo-uat exec -c leads-debug leads-debug-0 -ti -- sh'
alias kube-uat-pg='kubectl --context=staging --namespace=truleo-uat exec -c leads-debug leads-debug-0 -ti -- pg'
alias kube-uat-pgdump='kubectl --context=staging --namespace=truleo-uat exec -c leads-debug leads-debug-0 -- sh -c "pg_dump -h \$DATABASE_HOST -U \$DATABASE_USER -d \$DATABASE_DBNAME --exclude-table-data public.waveforms --exclude-table-data public.officer_audio_samples --exclude-table-data public.officer_audio_sample_segments --exclude-table-data public.speaker_fingerprints --no-blobs | gzip"'

alias kube-e='kubectl --context=staging --namespace=truleo-endor'
alias stern-e='stern --context=staging --namespace=truleo-endor'
alias kube-e-debug='kubectl --context=staging --namespace=truleo-endor exec -c leads-debug leads-debug-0 -ti -- sh'
alias kube-e-pg='kubectl --context=staging --namespace=truleo-endor exec -c leads-debug leads-debug-0 -ti -- pg'
alias kube-e-pgdump='kubectl --context=staging --namespace=truleo-endor exec -c leads-debug leads-debug-0 -- sh -c "pg_dump -h \$DATABASE_HOST -U \$DATABASE_USER -d \$DATABASE_DBNAME --exclude-table-data public.speaker_fingerprints --no-blobs | gzip"'

alias kube-n='kubectl --context=staging --namespace=truleo-naboo'
alias stern-n='stern --context=staging --namespace=truleo-naboo'
alias kube-n-debug='kubectl --context=staging --namespace=truleo-naboo exec -c leads-debug leads-debug-0 -ti -- sh'
alias kube-n-pg='kubectl --context=staging --namespace=truleo-naboo exec -c leads-debug leads-debug-0 -ti -- pg'
alias kube-n-pgdump='kubectl --context=staging --namespace=truleo-naboo exec -c leads-debug leads-debug-0 -- sh -c "pg_dump -h \$DATABASE_HOST -U \$DATABASE_USER -d \$DATABASE_DBNAME --exclude-table-data public.waveforms --exclude-table-data public.officer_audio_samples --exclude-table-data public.officer_audio_sample_segments --exclude-table-data public.speaker_fingerprints --no-blobs | gzip"'

alias kube-prod='kubectl --context=production --namespace=truleo'
alias stern-prod='stern --context=production --namespace=truleo'
alias kube-prod-debug='kubectl --context=production --namespace=truleo exec -c leads-debug leads-debug-0 -ti -- sh'
alias kube-prod-pg='kubectl --context=production --namespace=truleo exec -c leads-debug leads-debug-0 -ti -- pg'
alias kube-prod-pgdump='kubectl --context=production --namespace=truleo exec -c leads-debug leads-debug-0 -- sh -c "pg_dump -h \$DATABASE_HOST -U \$DATABASE_USER -d \$DATABASE_DBNAME --exclude-table-data public.waveforms --exclude-table-data public.officer_audio_samples --exclude-table-data public.officer_audio_sample_segments --exclude-table-data public.speaker_fingerprints --no-blobs | gzip"'

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
