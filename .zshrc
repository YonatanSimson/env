# Path to your oh-my-zsh installation.
  export ZSH=/home/amitshaked/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

  export PATH="/home/amitshaked/torch/install/bin:/home/amitshaked/torch/install/bin:/home/amitshaked/torch/install/bin:/usr/local/bin:/usr/bin:/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# cuda 
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias g01="ssh -X amitshaked1@rack-wolfson-g01.cs.tau.ac.il"
alias g02="ssh -X amitshaked1@rack-wolfson-g02.cs.tau.ac.il"
alias g03="ssh -X amitshaked1@rack-wolfson-g03.cs.tau.ac.il"
alias nova="ssh -X amitshaked1@nova"

# key bindings
if (( ${+terminfo[smkx]}  )) && (( ${+terminfo[rmkx]}  )); then
	function zle-line-init() {
	    echoti smkx
		   
}
function zle-line-finish() {
    echoti rmkx
	   
}
  zle -N zle-line-init
    zle -N zle-line-finish
 fi


 bindkey '\ew' kill-region                             # [Esc-w] - Kill from the cursor to the mark
 bindkey -s '\el' 'ls\n'                               # [Esc-l] - run command: ls
 bindkey '^r' history-incremental-search-backward      # [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
 if [[ "${terminfo[kpp]}" != ""  ]]; then
	 bindkey "${terminfo[kpp]}" up-line-or-history       # [PageUp] - Up a line of history
 fi
 if [[ "${terminfo[knp]}" != ""  ]]; then
	 bindkey "${terminfo[knp]}" down-line-or-history     # [PageDown] - Down a line of history
 fi

 # start typing + [Up-Arrow] - fuzzy find history forward
 if [[ "${terminfo[kcuu1]}" != ""  ]]; then
	 autoload -U up-line-or-beginning-search
	 zle -N up-line-or-beginning-search
	 bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
 fi
 # start typing + [Down-Arrow] - fuzzy find history backward
 if [[ "${terminfo[kcud1]}" != ""  ]]; then
	 autoload -U down-line-or-beginning-search
	 zle -N down-line-or-beginning-search
	 bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
 fi

 if [[ "${terminfo[khome]}" != ""  ]]; then
	 bindkey "${terminfo[khome]}" beginning-of-line      # [Home] - Go to beginning of line
 fi
 if [[ "${terminfo[kend]}" != ""  ]]; then
	 bindkey "${terminfo[kend]}"  end-of-line            # [End] - Go to end of line
 fi

 bindkey ' ' magic-space                               # [Space] - do history expansion

 bindkey '^[[1;5C' forward-word                        # [Ctrl-RightArrow] - move forward one word
 bindkey '^[[1;5D' backward-word                       # [Ctrl-LeftArrow] - move backward one word

 if [[ "${terminfo[kcbt]}" != ""  ]]; then
	 bindkey "${terminfo[kcbt]}" reverse-menu-complete   # [Shift-Tab] - move through the completion menu backwards
 fi

 bindkey '^?' backward-delete-char                     # [Backspace] - delete backward
 if [[ "${terminfo[kdch1]}" != ""  ]]; then
	 bindkey "${terminfo[kdch1]}" delete-char            # [Delete] - delete forward
 else
	 bindkey "^[[3~" delete-char
	 bindkey "^[3;5~" delete-char
	 bindkey "\e[3~" delete-char
 fi

 # Edit the current command line in $EDITOR
 autoload -U edit-command-line
 zle -N edit-command-line
 bindkey '\C-x\C-e' edit-command-line

 # file rename magick
 bindkey "^[m" copy-prev-shell-word"]]]]]"']]]]'


. /home/amitshaked/torch/install/bin/torch-activate

	. /home/amitshaked/torch/install/bin/torch-activate

	. /home/amitshaked/torch/install/bin/torch-activate

	. /home/amitshaked/torch/install/bin/torch-activate


. /home/amitshaked/torch/install/bin/torch-activate


. /home/amitshaked/torch/install/bin/torch-activate


. /home/amitshaked/torch/install/bin/torch-activate
