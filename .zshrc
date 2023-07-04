# dots git bare repo

alias config='/usr/bin/git --git-dir=$HOME/dots/ --work-tree=$HOME'
# have to use " to avoid unmatching with '
alias gitlog='git log --oneline -n 10 --graph --decorate --abbrev-commit'
alias gitlist='git diff-tree --no-commit-id --name-only -r'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles'

# Mac terminal color
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

precmd() {
        update_git_info
	update_nix_shell_info
}


# git functions
function git_staged_count() {
	echo $(git diff --cached --numstat | wc -l | tr -d '[:space:]')
}

function git_unstaged_count() {
        echo $(git diff --name-only | wc -l | tr -d '[:space:]')
}

function update_git_info() {
	git_prompt=""
	if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
		local staged_changes=$(git_staged_count)
		local unstaged_changes=$(git_unstaged_count)
		local branch=$(git symbolic-ref --short HEAD)
		git_prompt=" %F{blue}↑ $branch%f"
  
  		if [ $unstaged_changes -gt 0 ]; then
    			git_prompt+=" %F{magenta}-$unstaged_changes%f"
  		fi

        	if [ $staged_changes -gt 0 ]; then
                	git_prompt+=" %F{green}+$staged_changes%f"
        	fi
	fi	
}

function update_nix_shell_info() {
	nix_prompt=""
	if [[ $IN_NIX_SHELL = "impure" ]] || [[ $IN_NIX_SHELL = "pure" ]]; then
		nix_prompt=" %F{green}nix%f"
	fi
}

# enable environment variable sub in prompt option
setopt PROMPT_SUBST

# %n: name %m: machine %2d: 2 levels of dir
# PROMPT='%n@%m %F{yellow}(%2d)%f %# '
PROMPT='(%2d)${nix_prompt}${git_prompt} %# '

# right prompt with completion status and 24h time, hh:mm:ss
RPROMPT='%(?.%F{green}.%F{red}-)%f %F{250}%*%f'
