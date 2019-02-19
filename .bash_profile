
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#if [ -f $(brew --prefix)/etc/bash_completion ]; then
#  . $(brew --prefix)/etc/bash_completion
#fi
#
#if [ -f ~/.git-completion.bash ]; then
#  . ~/.git-completion.bash
#fi
#
#if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
#  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
#    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
#fi
#export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
#export EDITOR="/Applications/MacVim.app/Contents/bin/mvim"
