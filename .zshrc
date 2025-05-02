### PATHS ###

fpath=(/Users/betty.moreschini/.local/share/zsh/site-functions $fpath)

# append completions to fpath
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

export ZSH="/Users/betty.moreschini/.oh-my-zsh"
export PATH=/usr/local/bin:$PATH
export PATH="$HOME/.jenv/bin:$PATH"

export M2_HOME="/Users/betty.moreschini/Projects/apache-maven-3.9.0"
PATH="${M2_HOME}/bin:${PATH}"
export PATH

# Created by `pipx` on 2024-08-22 07:14:39
export PATH="$PATH:/Users/betty.moreschini/.local/bin"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export ASDF_DATA_DIR="$HOME/.asdf"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

###  END OF PATHS ###


### ZSH THEME CUSTOMISATION ###

ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir pyenv virtualenv java_version node_version vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S}"
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='blue'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='hotpink2'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'
POWERLEVEL9K_VIRTUALENV_FOREGROUND='yellow'
POWERLEVEL9K_VIRTUALENV_BACKGROUND='blue'
POWERLEVEL9K_PYENV_BACKGROUND='033'
POWERLEVEL9K_PYENV_PROMPT_ALWAYS_SHOW=true
POWERLEVEL9K_NODE_VERSION_BACKGROUND='darkseagreen4'
POWERLEVEL9K_JAVA_VERSION_BACKGROUND='orange1'

POWERLEVEL9K_VCS_GIT_GITHUB_ICON=""
POWERLEVEL9K_VCS_GIT_GITLAB_ICON="🦊"
POWERLEVEL9K_PYTHON_ICON="🐍"
POWERLEVEL9K_TIME_ICON="\u23F0"

# Add a space in the first prompt
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"
# Visual customisation of the second prompt line
# local user_symbol="★"
local user_symbol="🙈"
if [[ $(print -P "%#") =~ "#" ]]; then
    user_symbol = "#"
fi
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%B%F{black}%K{223}%} $user_symbol %{%b%f%k%F{223}%}%{%b%f%k%F{223}%} %{%f%}"


# Colorise the top Tabs of Iterm2 with the same color as background
# Just change the 18/26/33 wich are the rgb values
echo -e "\033]6;1;bg;red;brightness;18\a"
echo -e "\033]6;1;bg;green;brightness;26\a"
echo -e "\033]6;1;bg;blue;brightness;33\a"

plugins=(
	git
	zsh-autosuggestions
	poetry
	#jenv
)

source $ZSH/oh-my-zsh.sh

### END OF ZSH THEME CUSTOMISATION ###


### ALIASES ###

alias gac="git add . ; git commit -m $1"
alias mdlint="mdl -g --style mdl.rb ."
alias gauth="gcloud auth login ; gcloud auth application-default login"
alias token="echo $GITHUB_TOKEN"brew install pyenv nvm mysql
alias bpods="kubectl get pods -n braavos"

pgrep(){grep -Hrn --include \*.py $@}
activate(){source ~/Projects/venvs/$1/bin/activate;}
venv_create(){virtualenv ~/Projects/venvs/$1;}
ged() { gedit "$@" 2>> ~/.xsession-errors & }
connect() {kubectl port-forward $1 18000:5357 -n braavos}
blip () { poetry run python -m app.cli invoice-flow -sid $1 }

### END OF ALIASES ###

export NVM_DIR="$HOME/.nvm"
    [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/betty.moreschini/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/betty.moreschini/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/betty.moreschini/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/betty.moreschini/google-cloud-sdk/completion.zsh.inc'; fi
source /Users/betty.moreschini/Projects/es-dev-tools/scripts/cluster.sh
source /Users/betty.moreschini/Projects/es-dev-tools/scripts/tunnel.sh
source /Users/betty.moreschini/Projects/es-dev-tools/scripts/clean_up.sh

# Github token for npm
if [[ -e ~/.npmrc ]]; then
  export GITHUB_TOKEN=$(cat ~/.npmrc | grep //npm.pkg.github.com/:_authToken= | sed 's/^.*=//')
fi



#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
