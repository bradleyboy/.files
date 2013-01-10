# Setup the oh-my-zsh home directory and theme. I like the jnrowe one. Its
# minimalistic and suites me well.
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="jnrowe"

# Add Ubuntu's command-not-found ZSH alternative and use ssh-agent on the first
# terminal run. The other ones are just candies.
plugins=(git ruby bundler ssh-agent command-not-found)
source $ZSH/oh-my-zsh.sh

# Add color support for terminals pretending to be xterm.
[ $TERM = xterm ] && export TERM=xterm-256color

export EDITOR=vim # Help out programs spawning editors based on $EDITOR.
export PAGER=less # The same for pagers, just use less.

if [ -f /etc/profile.d/rvm.sh ] ; then source /etc/profile.d/rvm.sh ; fi
if [ -f ~/.aliases ] ; then source ~/.aliases ; fi
if [ -f ~/.localrc ] ; then source ~/.localrc ; fi
