export EDITOR=/usr/local/bin/nvim
set -o vi
source ~/vim_config/.bash-git-prompt/gitprompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
#export PS1='\w$(__git_ps1 "(%s)")\$ '
export PS1=''\u@\h:\w\$

alias ils='tmux attach -t illumio'
alias ictl='/var/illumio_pce/illumio-pce-ctl'
alias ictls='/var/illumio_pce/illumio-pce-ctl status -svw'
alias term='ssh vagrant@devtest26'
alias bo='bundle open'
alias be='bundle exec'
alias rc='be rails c'
alias rr='be rails routes'
source scl_source enable rh-git227

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Git Aliases (sorted alphabetically with some inculsive functions)
# Adapted from oh-my-zsh git alias plugin. "compdef" is a Z shell autocompletion function, disabled throughout where applicable. 

alias ll='ls -laFrt --color=auto'
alias g='git'

alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'

alias gb='git branch'
alias gba='git branch -a'
alias gbda='git branch --merged | command grep -vE "^(\*|\s*master\s*$)" | command xargs -n 1 git branch -d'
alias gbl='git blame -b -w'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'

alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gcan!='git commit -v -a -s --no-edit --amend'
alias gcam='git commit -a -m'
alias gcb='git checkout -b'
alias gcf='git config --list'
alias gcl='git clone --recursive'
alias gclean='git clean -fd'
alias gpristine='git reset --hard && git clean -dfx'
alias gcm='git checkout master'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gcount='git shortlog -sn'
#compdef gcount=git
alias gcp='git cherry-pick'
alias gcs='git commit -S'

alias gd='git diff'
alias gdca='git diff --cached'
alias gdct='git describe --tags `git rev-list --tags --max-count=1`'
alias gdt='git diff-tree --no-commit-id --name-only -r'

function gdv() { 
  git diff -w "$@" | view - 
}
#compdef _git gdv=git-diff

alias gdw='git diff --word-diff'
alias gf='git fetch'
alias gfa='git fetch --all --prune'

function gfg() { 
  git ls-files | grep $@ 
}
#compdef gfg=grep

alias gfo='git fetch origin'

alias gg='git gui citool'
alias gga='git gui citool --amend'
alias current_branch='$ git symbolic-ref --short HEAD'

function ggf() {
  [[ "$#" != 1 ]] && local b="$(current_branch)"
  git push --force origin "${b:=$1}"
}
#compdef _git ggf=git-checkout

function ggl() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
  git pull origin "${*}"
  else
  [[ "$#" == 0 ]] && local b="$(current_branch)"
  git pull origin "${b:=$1}"
  fi
}
#compdef _git ggl=git-checkout

alias ggpull='git pull origin $(current_branch)'
#compdef _git ggpull=git-checkout

function ggp() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
  git push origin "${*}"
  else
  [[ "$#" == 0 ]] && local b="$(current_branch)"
  git push origin "${b:=$1}"
  fi
}
#compdef _git ggp=git-checkout

alias ggpush='git push origin $(current_branch)'
#compdef _git ggpush=git-checkout

function ggpnp() {
  if [[ "$#" == 0 ]]; then
  ggl && ggp
  else
  ggl "${*}" && ggp "${*}"
  fi
}
#compdef _git ggpnp=git-checkout

alias ggsup='git branch --set-upstream-to=origin/$(current_branch)'

gch() {
 git checkout “$(git branch — all | fzf| tr -d ‘[:space:]’)”
}

function ggu() {
  [[ "$#" != 1 ]] && local b="$(current_branch)"
  git pull --rebase origin "${b:=$1}"
}
#compdef _git ggu=git-checkout

_gen_fzf_default_opts() {
  local base03="234"
  local base02="235"
  local base01="240"
  local base00="241"
  local base0="244"
  local base1="245"
  local base2="254"
  local base3="230"
  local yellow="136"
  local orange="166"
  local red="160"
  local magenta="125"
  local violet="61"
  local blue="33"
  local cyan="37"
  local green="64"
  # Uncomment for truecolor, if your terminal supports it.
  # local base03="#002b36"
  # local base02="#073642"
  # local base01="#586e75"
  # local base00="#657b83"
  # local base0="#839496"
  # local base1="#93a1a1"
  # local base2="#eee8d5"
  # local base3="#fdf6e3"
  # local yellow="#b58900"
  # local orange="#cb4b16"
  # local red="#dc322f"
  # local magenta="#d33682"
  # local violet="#6c71c4"
  # local blue="#268bd2"
  # local cyan="#2aa198"
  # local green="#859900"

  # Comment and uncomment below for the light theme.

  # Solarized Dark color scheme for fzf
  #export FZF_DEFAULT_OPTS="
  #  --color fg:-1,bg:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue
  #  --color info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
  #"
  ## Solarized Light color scheme for fzf
  export FZF_DEFAULT_OPTS="
    --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue
    --color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
  "
}
_gen_fzf_default_opts

alias ggpur='ggu'
#compdef _git ggpur=git-checkout

alias gignore='git update-index --assume-unchanged'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
#compdef git-svn-dcommit-push=git

alias gk='\gitk --all --branches'
#compdef _git gk='gitk'
alias gke='\gitk --all $(git log -g --pretty=format:%h)'
#compdef _git gke='gitk'

alias gl='git pull'
alias glg='git log --stat --color'
alias glgp='git log --stat --color -p'
alias glgg='git log --graph --color'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glo='git log --oneline --decorate --color'
alias glol="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glola="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
alias glog='git log --oneline --decorate --color --graph'
alias glp="_git_log_prettily"
#compdef _git glp=git-log

alias gm='git merge'
alias gmom='git merge origin/master'
alias gmt='git mergetool --no-prompt'
alias gmtvim='git mergetool --no-prompt --tool=vimdiff'
alias gmum='git merge upstream/master'

alias gp='git push'
alias gpd='git push --dry-run'
alias gpoat='git push origin --all && git push origin --tags'
#compdef _git gpoat=git-push
alias gpu='git push upstream'
alias gpv='git push -v'
alias gpsup='git push --set-upstream origin $(git_current_branch)'

alias gr='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'
alias grbm='git rebase master'
alias grbs='git rebase --skip'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grset='git remote set-url'
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'
alias gru='git reset --'
alias grup='git remote update'
alias grv='git remote -v'

alias gsb='git status -sb'
alias gsd='git svn dcommit'
alias gsi='git submodule init'
alias gsps='git show --pretty=short --show-signature'
alias gsr='git svn rebase'
alias gss='git status -s'
alias gst='git status'
alias gsta='git stash'
alias gstaa='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --text'
alias gsu='git submodule update'

alias gts='git tag -s'
alias gtv='git tag | sort -V'

alias gunignore='git update-index --no-assume-unchanged'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias gup='git pull --rebase'
alias gupv='git pull --rebase -v'
alias glum='git pull upstream master'

alias gvt='git verify-tag'

alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit -m "--wip--"'

# Git completion for some of the above aliases.

# __git_complete g __git_main
# __git_complete ga _git_add
# __git_complete gb _git_branch
# __git_complete gc _git_commit
# __git_complete gcl _git_clone
# __git_complete gco _git_checkout
# __git_complete gd _git_diff
# __git_complete gl _git_pull
# __git_complete glg _git_log
# __git_complete gm _git_merge
# __git_complete gp _git_push
# __git_complete gsps _git_show
export PATH="/usr/local/cmake/bin:$PATH"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' 
	--color=fg:#c5cdd9,bg:#262729,hl:#6cb6eb 
	--color=fg+:#c5cdd9,bg+:#262729,hl+:#5dbbc1 
	--color=info:#88909f,prompt:#ec7279,pointer:#d38aea 
	--color=marker:#a0c980,spinner:#ec7279,header:#5dbbc1'
eval "$(zoxide init bash)"
export PS1=''\u@\h:\w\$
