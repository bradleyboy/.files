# Include local machine custom settings.
[ -f ~/.bashrc.before ] && source ~/.bashrc.before

# ~/bin are prepended to the PATH, so we can override system utils, if needed.
# The path for the custom coreutils and /usr/loca/bin are my preferences on
# OSX.
export PATH=~/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:$PATH

# Initialize rbenv before initializing the plugins. The bundler plugin needs
# the bundle executable available, so...
[ -z $SKIP_RBENV ] && $(which rbenv &> /dev/null) && {
  export PATH=~/.rbenv/bin:/~/.rbenv/shims:$PATH
  eval "$(rbenv init -)"
}

# Initialize direnv for the bash
[ -z $SKIP_DIRENV ] && $(which direnv &> /dev/null) && eval "$(direnv hook bash)"

# Add color support for terminals pretending to be xterm.
[ $TERM = xterm ] && export TERM=xterm-256color

# Make sure we have a unicode capable LANG and LC_CTYPE so the unicode
# characters does not look like crap on OSX and other environments.
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Help out programs spawning editors based on $EDITOR. The same for pagers,
# just use less for them.
export EDITOR=vim
export PAGER=less

# Source all of the aliases living in ~/.aliases.
[ -z $SKIP_ALIASES] && [ -f ~/.aliases ] && source ~/.aliases

# Use the custom solarized LS colors.
$(which dircolors &> /dev/null) && {
  [ -z $SKIP_DIRCOLORS ] && [ -f ~/.dir_colors ] && eval "$(dircolors ~/.dir_colors)"
}

# Include local machine custom settings.
[ -f ~/.bashrc.after ] && source ~/.bashrc.after
