#  Prof Jimes Bash Profile


#   Description:  This file holds all my BASH configurations and aliases
#
#   Sections:
#   1.  Environment Configuration
#   2.  Make Terminal Better
#   3.  Custom Functions
#   4.  Custom Prompt


#   ---------------------------------------------------------------------------
#   1. ENVIRONMENT CONFIGURATION
#   ---------------------------------------------------------------------------


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
	alias gg='git status'		# shortcut for git status


#   ---------------------------------------
#   3. CUSTOM FUNCTIONS
#   ---------------------------------------



#   ---------------------------------------
#   4. CUSTOM PROMPT
#   ---------------------------------------


parse_git_branch() {
    branch="$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')"

    git_status="$(git status 2> /dev/null)"
    branch_pattern="^# On branch ([^${IFS}]*)"
    detached_branch_pattern="# Not currently on any branch"
    remote_pattern="# Your branch is (.*) of"
    diverge_pattern="# Your branch and (.*) have diverged"
    untracked_pattern="# Untracked files"
    new_pattern="new file:"
    not_staged_pattern="Changes not staged for commit"

    # default unless otherwise
	color="$(tput setaf 2)"

	#files not staged for commit
    if [[ ${git_status}} =~ ${not_staged_pattern} ]]; then
        state="$(tput setaf 1)✔"
        color="$(tput setaf 3)"
    fi

    # add an else if or two here if you want to get more specific
    # show if we're ahead or behind HEAD
    if [[ ${git_status} =~ ${remote_pattern} ]]; then
        if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
            remote="$(tput setaf 2)↑"
            color="$(tput setaf 3)"
        else
            remote="$(tput setaf 1)↓"
            color="$(tput setaf 1)"
        fi
    fi

    #new files
    if [[ ${git_status} =~ ${new_pattern} ]]; then
        remote="+"
        color="$(tput setaf 3)"
    fi

    #untracked files
    if [[ ${git_status} =~ ${untracked_pattern} ]]; then
        remote="✖"
        color="$(tput setaf 3)"
    fi

    #diverged branch
    if [[ ${git_status} =~ ${diverge_pattern} ]]; then
        remote="↕"
        color="$(tput setaf 1)"
    fi

    #branch name
    if [[ ${git_status} =~ ${branch_pattern} ]]; then
        branch=${BASH_REMATCH[1]}
    elif [[ ${git_status} =~ ${detached_branch_pattern} ]]; then
        branch="NO BRANCH"
        color="$(tput setaf 1)"
    fi

    if [[ ${git_status}} =~ "nothing to commit, working tree clean" ]]; then
	    state="♥"
	fi

    echo "${color}${branch}${state}${remote}"
}

export PS1=' \[$(tput setaf 6)\]ProfJimes \[$(tput sgr0)\]\W$(parse_git_branch)\[$(tput sgr0)\] '



