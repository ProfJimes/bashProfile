#  Prof Jimes Bash Profile


#   Description:  This file holds all my BASH configurations and aliases
#
#   Sections:
#   1.  Environment Configuration
#   2.  Make Terminal Better
#   3.  Custom Functions


#   ---------------------------------------------------------------------------
#   1. ENVIRONMENT CONFIGURATION
#   ---------------------------------------------------------------------------


#   Change Prompt
#   -------------
    export PS1="\[$(tput setaf 6)\] ProfJimes\[$(tput sgr0)\] \W: "


#   Colorize Terminal
#   -----------------
#   export CLICOLOR=1
#   export LSCOLORS=GxFxCxDxBxegedabagaced


#   ---------------------------------------------------------------------------
#   2. MAKE TERMINAL BETTER
#   ---------------------------------------------------------------------------


#   Super Useful Common Shortcuts
#   -----------------------------
	alias c='clear'			# Single Character Clean
	alias ls='ls -1AFG' 		# full ls
	alias o='open .'		# Open in Finder
	cd() { builtin cd "$@"; ls; }   # ls when cd'ing into a directory


#   ---------------------------------------
#   3. CUSTOM FUNCTIONS
#   ---------------------------------------

