# Load the Antibody plugin manager for zsh.
source <(antibody init)

# Setup required env var for oh-my-zsh plugins
export ZSH=$(antibody path ohmyzsh/ohmyzsh)


antibody bundle ohmyzsh/ohmyzsh
antibody bundle ohmyzsh/ohmyzsh path:plugins/cp
antibody bundle ohmyzsh/ohmyzsh path:plugins/git
antibody bundle ohmyzsh/ohmyzsh path:plugins/npm
antibody bundle ohmyzsh/ohmyzsh path:themes/miloshadzic.zsh-theme

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
