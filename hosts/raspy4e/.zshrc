# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH="$HOME/.oh-my-zsh"

# Tema:
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins:
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Mejoras de terminal:
export TERM=xterm-256color
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Historial decente:
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history

# Navegación moderna:
setopt autocd
setopt hist_ignore_space
setopt share_history

# Alias útiles:
alias gs="git status"
alias gp="git pull"
alias gpp="git pull && git push"
alias mm="rclone mount --allow-other --allow-non-empty --daemon gdrive:/home/antjrobles/gdrive/"
alias upd="sudo apt update && sudo apt dist-upgrade"
alias mem10="ps auxf | sort -nr -k 4 | head -10"
alias mem2="ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -10"
alias cpu10="ps auxf | sort -nr -k 3 | head -10"
alias freeswap="swapoff -a && swapon -a"
alias dc="docker-compose down && docker-compose up -d"
alias ll="ls"
alias la="ls -la"
alias nn="sudo nano docker-compose.yml"
alias vv="sudo nvim"
alias i="sudo apt-get install"
alias ports='echo "sudo netstat -tulpn | grep LISTEN | grep :80"'
alias ..="cd .." 
alias ...="../.."
alias grep="grep --color=auto"
alias reload="source ~/.zshrc"
alias c='clear'
alias rm='rm -i'
alias mv='mv -iv'
alias cp='cp -iv'
alias off='sudo reboot -h now'
alias myip="curl http://ipecho.net/plain; echo"
alias iplocal="ip route get 1 | awk '{print $7}'"
alias c="clear"
alias op="openclaw"



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="$HOME/.npm-global/bin:$PATH"

# OpenClaw Completion
source "/home/antjrobles/.openclaw/completions/openclaw.zsh"
