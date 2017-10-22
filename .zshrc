# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel9k/powerlevel9k"
DEFAULT_USER="$USER"
EDITOR=nvim
export VISUAL=nvim
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

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
plugins=(git common-aliases history sudo web-search)

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

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
export PATH=$PATH:$HOME/.nvim/plugged/rust.vim/syntax_checkers/rust/
export PATH=$HOME/pi-tools/rust-on-raspberry-pi:/home/honorabrutroll/pi-tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin:$PATH
export PATH=$HOME/.multirust/toolchains/nightly/cargo/bin:$PATH
alias reflupdate='sudo reflector --verbose --country 'United States'  -l 5 -p http --sort rate --threads 1 --save /etc/pacman.d/mirrorlist && yaourt -Syy'
export PATH=/home/honorabrutroll/.gem/ruby/2.3.0/bin:$PATH
export BROWSER=/usr/bin/firefox-developer
# added by travis gem
[ -f /home/honorabrutroll/.travis/travis.sh ] && source /home/honorabrutroll/.travis/travis.sh
export RUST_NEW_ERROR_FORMAT=1
export CARGO_INCREMENTAL=1
#export RUSTDOCFLAGS="-Z unstable-options --extend-css $HOME/scripts/rustdoc_ayu.css"
#eval "$(nodenv init -)"
alias cloc=tokei
alias grep=rg
alias ls=exa
alias update=/home/efyang/scripts/update
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

PATH="/home/efyang/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/efyang/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/efyang/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/efyang/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/efyang/perl5"; export PERL_MM_OPT;
