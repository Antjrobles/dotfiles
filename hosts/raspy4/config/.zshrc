# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"
#ZSH_THEME="rkj-repos"
#ZSH_THEME="amuse"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=es_ES.UTF-8
export LC_ALL=C.UTF-8
export LANG=C.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"

# alias ohmyzsh="mate ~/.oh-my-zsh"
#
autoload -Uz compinit
compinit
_comp_options+=(globdots)


# MI PERSONAL CONFIG #
# aliases (definidos por mi)
alias aa="cd /mnt/MIHDD/Appdata"
alias mm="rclone mount --allow-other --allow-non-empty --daemon gdrive: /home/antjrobles/gdrive/"
alias upd="sudo apt update && sudo apt dist-upgrade"
alias mem10="ps auxf | sort -nr -k 4 | head -10"
alias mem2="ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -10"
alias cpu10="ps auxf | sort -nr -k 3 | head -10"
alias freeswap="swapoff -a && swapon -a"
alias dc="docker-compose down && docker-compose up -d"
alias ll="ls -lh"
alias nn="sudo nano docker-compose.yml"
alias vv="sudo nvim"
alias i="sudo apt-get install "
alias ..="cd .."  
alias i="sudo apt-get install"
alias ports='echo "sudo netstat -tulpn | grep LISTEN | grep :80"'
alias grep="grep --color=auto"
alias reload="source ~/.zshrc"
alias c='clear'
alias rm='rm -i'
alias mv='mv -iv'
alias cp='cp -iv'
alias off='sudo reboot -h now'
alias myip="curl http://ipecho.net/plain; echo"


# BATCAT
alias bat="batcat"

# NALA
alias nala="sudo nala"

#GIT
alias gs="git status"
alias ga="git add ."
alias gca="git commit -m \" added\""
alias gp="git push"  
# EXA aliases
alias ls='exa --icons --group-directories-first'
alias ll='exa -lg --icons --group-directories-first --time-style long-iso'
alias la='exa -lag --icons --group-directories-first --time-style long-iso'

# TMUX
alias tm="tmux"


# First neofetch must be installed
neofetch

# Starship
eval "$(starship init zsh)"


#RIPGREP CONFIG 
rgf() {
    local file
    file=$(rg --files --hidden --no-ignore --no-messages --follow --glob "!.git" 2> /dev/null | fzf +m -q "$1" --preview "bat --style=numbers --color=always {} 2> /dev/null | head -500")
    if [[ -n "$file" ]]; then
        bat --style=numbers --color=always "$file"
    fi
}



export PATH=$PATH:/home/antjrobles/.cargo/bin



# Buscar el en historial con fzf
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

if [[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

if [[ -f /usr/share/doc/fzf/examples/completion.zsh ]]; then
  source /usr/share/doc/fzf/examples/completion.zsh
fi




export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
