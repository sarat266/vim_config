export PATH="$PATH:$HOME/.rvm/bin:/usr/local/Cellar/postgresql@11/11.3/bin/" # Add RVM to PATH for scripting

if [ -f $HOME/.bash_profile ]; then
  source $HOME/.bash_profile
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
