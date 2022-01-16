# dots git bare repo
alias config='/usr/bin/git --git-dir=$HOME/dots/ --work-tree=$HOME'

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

#jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

#brew java
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/usr/local/opt/openjdk/include"
