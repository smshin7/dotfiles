# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.  # export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/scottshin/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="theunraveler"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
plugins=(git wd rails)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias v="vim ."
alias rz="source ~/.zshrc"
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
alias brewup="brew update; brew upgrade; brew cleanup; brew doctor"

alias launch="/Users/scottshin/Medely/medely/launch.sh"

alias mdstart="wd md; rails s --binding=0.0.0.0"
alias mdcstart="wd md; ./bin/webpack-dev-server"
alias mdgstart="wd mdg;npm start"
alias mdgcstart="wd mdgc;npm start" #admin-client
alias mdfstart="wd mdf;npm start" # facility-client
alias mdpstart="wd mdp;npm start" # pro-client
alias mdlstart="wd mdl;npm run dev"
alias kikstart="wd md;bundle exec sidekiq"
# alias mdpdfstart="wd mdpdf;npm start"
# alias mdresstart="wd mdres;npm start"

alias gcstage='gcloud config set project medely-staging && gcloud config set compute/zone us-west1 && gcloud container clusters get-credentials medely-staging && POD=$(kubectl get pods -l app=medely --field-selector=status.phase==Running -n staging -o jsonpath="{.items[0].metadata.name}") && kubectl exec -it $POD -n staging -- /bin/bash'
alias gcroles='gcloud config set project medely-staging && gcloud config set compute/zone us-west1 && gcloud container clusters get-credentials medely-staging && POD=$(kubectl get pods -l app=medely-roles --field-selector=status.phase==Running -n roles -o jsonpath="{.items[0].metadata.name}") && kubectl exec -it $POD -n roles -- /bin/bash'
alias gcfeature='gcloud config set project medely-staging && gcloud config set compute/zone us-west1 && gcloud container clusters get-credentials medely-staging && POD=$(kubectl get pods -l app=medely-feature --field-selector=status.phase==Running -n feature -o jsonpath="{.items[0].metadata.name}") && kubectl exec -it $POD -n feature -- /bin/bash'
alias gcprod='gcloud config set project medely-production && gcloud config set compute/zone us-west1 && gcloud container clusters get-credentials medely && POD=$(kubectl get pods -l app=medely --field-selector=status.phase==Running -o jsonpath="{.items[0].metadata.name}") && kubectl exec -it $POD -- /bin/bash'

# PG proxy
alias stagepx="~/cloud_sql_proxy -instances=medely-staging:us-west1:med-staging-14=tcp:5435"
alias prodpx="~/cloud_sql_proxy -instances=medely-production:us-west1:medely-production-replica-15=tcp:5433"
alias pgdump="pg_dump -h 127.0.0.1 -p 5433 -U postgres -Fc --no-owner --exclude-table-data audits --no-acl medely_production > ~/Downloads/backup.sql"
alias pgrestore="pg_restore -U postgres ~/Downloads/backup.sql -e -O -d medely_development"

# Git aliases
alias gpod="git pull origin dev"
alias gpos="git pull origin staging"
alias gpos="git pull origin feature-deploy"
alias grhh="git reset --hard head"
alias gpo="git pull origin"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/scottshin/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/scottshin/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/scottshin/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/scottshin/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add NVM to PATH for scripting
export NVM_DIR="$HOME/.nvm"


# Google Cloud SDK PYTHON Path
export CLOUDSDK_PYTHON="/usr/bin/python3"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme
