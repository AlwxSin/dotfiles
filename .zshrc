# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
# mason downloads a lot of tools, don't need to install them separately
export PATH=$PATH:$HOME/.local/share/nvim/mason/bin
export GOPATH=$(go env GOPATH)

export ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd.mm.yyyy"
HISTSIZE=10000
HIST_IGNORE_DUPS=true
HIST_IGNORE_SPACE=true
INC_APPEND_HISTORY=true
SHARE_HISTORY=true
export HISTFILE=~/.zsh_history

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

###### PROMT
eval "$(oh-my-posh init zsh --config ~/.config/alwx_shell/omp-zen.toml)"

###### PLUGINS
####### OH-MY-ZSH
# Path to your Oh My Zsh installation.
# export ZSH="$HOME/.oh-my-zsh"
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git httpie docker direnv fzf golang helm kubectl nats)
# source $ZSH/oh-my-zsh.sh

####### ANTIGEN
# source ~/antigen.zsh
# antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle "MichaelAquilina/zsh-you-should-use"
# antigen apply

###### ZCOMET
# wow, it's fast
# Clone zcomet if necessary
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

zcomet load ohmyzsh plugins/gitfast
zcomet load ohmyzsh plugins/direnv
zcomet load ohmyzsh plugins/fzf
zcomet load ohmyzsh plugins/httpie
zcomet load ohmyzsh plugins/docker
zcomet load ohmyzsh plugins/golang
zcomet load ohmyzsh plugins/helm
zcomet load ohmyzsh plugins/kubectl
zcomet load ohmyzsh plugins/nats
zcomet load MichaelAquilina/zsh-you-should-use

zcomet load ohmyzsh lib functions.zsh
zcomet load ohmyzsh lib clipboard.zsh
zcomet load ohmyzsh lib completion.zsh
zcomet load ohmyzsh lib directories.zsh
zcomet load ohmyzsh lib key-bindings.zsh
zcomet load ohmyzsh lib termsupport.zsh

zcomet load zsh-users/zsh-syntax-highlighting
zcomet load zsh-users/zsh-autosuggestions
zcomet compinit

# MY ENVS
source "$HOME/.config/alwx_shell/env.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

###### KEY BINDINGS
bindkey -s ^f "tmux-sessionizer\n"
