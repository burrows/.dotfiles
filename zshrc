# Don't put duplicate lines in the history.
export HISTCONTROL=ignoredups

set -o vi

alias less='less -r'
alias ls='gls --classify --color'
alias ll='gls -ltr --classif --color'
alias grep='grep --color'
alias ack='ag'
alias vim='nvim'

# Truleo
alias leads='cd ~/code/truleo/leads'
alias client='cd ~/code/truleo/leads/client'
alias server='cd ~/code/truleo/leads/server'

alias ks='kubectl --context=staging -n truleo'
alias ss='stern --context=staging -n truleo'
alias ks-debug='kubectl --context=staging -n truleo exec -c leads-debug leads-debug-0 -ti -- sh'
alias ks-pg='kubectl --context=staging -n truleo exec -c leads-debug leads-debug-0 -ti -- pg'
alias ks-pgdump='kubectl --context=staging -n truleo exec -c leads-debug leads-debug-0 -- sh -c "pg_dump -h \$DATABASE_HOST -U \$DATABASE_USER -d \$DATABASE_DBNAME | gzip"'

alias ku='kubectl --context=uat'
alias su='stern --context=uat'
alias ku-debug='kubectl --context=uat exec -c leads-debug leads-debug-0 -ti -- sh'
alias ku-pg='kubectl --context=uat exec -c leads-debug leads-debug-0 -ti -- pg'
alias ku-pgdump='kubectl --context=uat exec -c leads-debug leads-debug-0 -- sh -c "pg_dump -h \$DATABASE_HOST -U \$DATABASE_USER -d \$DATABASE_DBNAME | gzip"'

alias ke='kubectl --context=endor'
alias se='stern --context=endor'
alias ke-debug='kubectl --context=endor exec -c leads-debug leads-debug-0 -ti -- sh'
alias ke-pg='kubectl --context=endor exec -c leads-debug leads-debug-0 -ti -- pg'
alias ke-pgdump='kubectl --context=endor exec -c leads-debug leads-debug-0 -- sh -c "pg_dump -h \$DATABASE_HOST -U \$DATABASE_USER -d \$DATABASE_DBNAME | gzip"'

alias kn='kubectl --context=naboo'
alias sn='stern --context=naboo'
alias kn-debug='kubectl --context=naboo exec -c leads-debug leads-debug-0 -ti -- sh'
alias kn-pg='kubectl --context=naboo exec -c leads-debug leads-debug-0 -ti -- pg'
alias kn-pgdump='kubectl --context=naboo exec -c leads-debug leads-debug-0 -- sh -c "pg_dump -h \$DATABASE_HOST -U \$DATABASE_USER -d \$DATABASE_DBNAME | gzip"'

alias kp='kubectl --context=production -n truleo'
alias sp='stern --context=production -n truleo'
alias kp-debug='kubectl --context=production -n truleo exec -c leads-debug leads-debug-0 -ti -- sh'
alias kp-pg='kubectl --context=production -n truleo exec -c leads-debug leads-debug-0 -ti -- pg'
alias kp-pgdump='kubectl --context=production -n truleo exec -c leads-debug leads-debug-0 -- sh -c "pg_dump -h \$DATABASE_HOST -U \$DATABASE_USER -d \$DATABASE_DBNAME | gzip"'

export NODE_PATH=/usr/local/lib/node:/usr/local/lib/node_modules

function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

