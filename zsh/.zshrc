# Setting the Shell env
eval $(/opt/homebrew/bin/brew shellenv)

# fpath ergaenzen fuer das theme
fpath=( "$HOME/.config/zsh" $fpath )

# set spaceship theme
source "$(brew --prefix)/opt/spaceship/spaceship.zsh"
autoload -U promptinit; promptinit

# Docker autocomplete when using double args like -it
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# change Dir without cd
setopt autocd

# no file clobbering
setopt noclobber

# autocomplete
autoload -Uz compinit
compinit

# weird history shit
setopt no_share_history
unsetopt share_history

# autocomplete with sudo
zstyle ':completion::complete:*' gain-privileges 1

# compeltion
zstyle ':completion:*' menu select
zmodload zsh/complist

# colorize the completion like ls
zstyle -e ':completion:*:default' list-colors 'reply=(":${(s.:.)LS_COLORS}")'

# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# generell vim bindings
bindkey -v
bindkey 'jk' vi-cmd-mode

# Keybindings
bindkey '^o' autosuggest-accept

# tab complete dot files
_comp_options+=(globdots)

# auto rehash
zstyle ':completion:*' rehash true

# extend History
HISTSIZE=10000
SAVEHIST=10000

# auto suggestion Highlite
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#7e7e7e"

# Spaceship Theme things
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
SPACESHIP_PROMPT_ADD_NEWLINE=false

SPACESHIP_CHAR_SYMBOL="➜  "
SPACESHIP_CHAR_SYMBOL_ROOT=" "

SPACESHIP_USER_SHOW=true
SPACESHIP_USER_PREFIX=""

SPACESHIP_DIR_PREFIX=""
SPACESHIP_DIR_TRUNC=5
SPACESHIP_DIR_LOCK_SYMBOL="  "

SPACESHIP_GIT_STATUS_PREFIX=" state "
SPACESHIP_GIT_STATUS_SUFFIX=""
SPACESHIP_GIT_STATUS_UNTRACKED="? "
SPACESHIP_GIT_STATUS_ADDED="+ "
SPACESHIP_GIT_STATUS_MODIFIED="! "
SPACESHIP_GIT_STATUS_RENAMED="» "
SPACESHIP_GIT_STATUS_DELETED="✘ "
SPACESHIP_GIT_STATUS_STASHED="$ "
SPACESHIP_GIT_STATUS_UNMERGED="= "
SPACESHIP_GIT_STATUS_AHEAD="⇡ "
SPACESHIP_GIT_STATUS_BEHIND="⇣ "
SPACESHIP_GIT_STATUS_DIVERGED="⇕ "

SPACESHIP_PACKAGE_SYMBOL="  "
SPACESHIP_PACKAGE_COLOR=yellow

SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_EXIT_CODE_SYMBOL=" "
SPACESHIP_DOCKER_SYMBOL="  "
SPACESHIP_RUST_SYMBOL=" "
SPACESHIP_PHP_SYMBOL=" "
SPACESHIP_PYTHON_SYMBOL=" "
SPACESHIP_BATTERY_SHOW=false

#Gcloud
SPACESHIP_GCLOUD_SYMBOL=" "
SPACESHIP_GCLOUD_COLOR=blue

#Terraform
SPACESHIP_TERRAFORM_SYMBOL="行 "

# Needed to run Vi mode
SPACESHIP_VI_MODE_PREFIX=" "
SPACESHIP_VI_MODE_COLOR=green
SPACESHIP_VI_MODE_INSERT="[I]"
SPACESHIP_VI_MODE_NORMAL="[N]"

SPACESHIP_VENV_COLOR=yellow
SPACESHIP_VENV_SYMBOL="󱎶 "

SPACESHIP_JOBS_SYMBOL="✦ "

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  package       # Package version
  node          # Node.js section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  docker        # Docker section
  #aws           # Amazon Web Services section
  gcloud        # Google Cloud Platform section
  kubectl       # Kubectl context section
  terraform     # Terraform workspace section
  venv          # Python virtualenv section
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
  exec_time     # Execution time
  jobs          # Background jobs indicator
)

# Install Plugins
source "$HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/.config/zsh/plugins/extract/extract.plugin.zsh"
source "$HOME/.config/zsh/plugins/gcloud/gcloud.plugin.zsh"
# source "$HOME/.config/zsh/plugins/aws/aws.plugin.zsh"
source "$HOME/.config/zsh/plugins/encode64/encode64.plugin.zsh"
source "$HOME/.config/zsh/plugins/kubetail/kubetail.plugin.zsh"
source "$HOME/.config/zsh/plugins/kubectl/kubectl.plugin.zsh"
source "$HOME/.config/zsh/plugins/spaceship-vi-mode/spaceship-vi-mode.plugin.zsh"


# colored man pages because plugin not working....
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# Auto complete for lab
# source <(lab completion zsh)

# Auto completion fzf
eval "$(fzf --zsh)"

lab-use () {
  cp $HOME/.config/lab/lab.$1.toml $HOME/.config/lab/lab.toml
  echo "Changing config to $1"
}

# quick dir change
DIRSTACKSIZE=10
setopt autopushd pushdminus pushdsilent pushdtohome
alias d='dirs -v | head -10'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

# Aliases
alias diff='diff --color=auto'
alias ls='ls --color=auto'
alias local-test="sudo docker run --rm -it -v "$PWD":"$PWD" --workdir "$PWD" -v /var/run/docker.sock:/var/run/docker.sock gitlab/gitlab-runner gitlab-runner exec docker --docker-disable-cache --builds-dir /tmp"$PWD" --docker-volumes /var/run/docker.sock:/var/run/docker.sock local-test"
alias wetter="curl wttr.in"
alias mensa="curl -q https://mensaplan.leet.fan/"
alias -g G="| grep --color=auto -i"
alias est="sudo openvpn --config /etc/openvpn/client/EST.ovpn --daemon"
alias xilinx="xhost + 'local:docker@' && docker run -dit --rm --name xilinx -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/p4ck3t0/uni/cryptoaufhardware/data/:/xilinx/data/ --privileged -v /dev/bus/usb:/dev/bus/usb xilinx:latest"
alias zathura="zathura --fork"
alias vlc="vlc -q &> /dev/null"
alias cat="bat --paging=never"


# autocomplete
source <(kubectl completion zsh)
source <(helm completion zsh)

#pyenv
eval "$(pyenv init -)"

#iterm2
alias imgcat=${ZDOTDIR}/.iterm2/imgcat;alias imgls=${ZDOTDIR}/.iterm2/imgls;alias it2api=${ZDOTDIR}/.iterm2/it2api;alias it2attention=${ZDOTDIR}/.iterm2/it2attention;alias it2check=${ZDOTDIR}/.iterm2/it2check;alias it2copy=${ZDOTDIR}/.iterm2/it2copy;alias it2dl=${ZDOTDIR}/.iterm2/it2dl;alias it2getvar=${ZDOTDIR}/.iterm2/it2getvar;alias it2git=${ZDOTDIR}/.iterm2/it2git;alias it2setcolor=${ZDOTDIR}/.iterm2/it2setcolor;alias it2setkeylabel=${ZDOTDIR}/.iterm2/it2setkeylabel;alias it2tip=${ZDOTDIR}/.iterm2/it2tip;alias it2ul=${ZDOTDIR}/.iterm2/it2ul;alias it2universion=${ZDOTDIR}/.iterm2/it2universion;alias it2profile=${ZDOTDIR}/.iterm2/it2profile;alias it2cat=${ZDOTDIR}/.iterm2/it2cat
