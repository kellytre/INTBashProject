# ~/.bash_profile

# Ensure .bashrc is sourced if it exists
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# Set up the PATH variable
export PATH=$PATH:$HOME/bin:/usr/local/bin

# Set environment variables
export COURSE_ID='DevOpsTheHardWay'
export COURSE_ID='__REPO_NAME__'
export EDITOR=nano
export HISTSIZE=1000
export HISTFILESIZE=2000

# Set custom prompt (PS1)
export PS1="\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]$ "

# Alias definitions
alias ll='ls -la'
alias gs='git status'
alias gp='git pull'
alias venv='source venv/bin/activate'
alias ltxt='ls -la | grep -i *.txt'

# Start the ssh-agent
eval "$(ssh-agent -s)"
echo "Hello $USER "

#create tmp folder
mkdir $HOME/tmp

# Define the path to the .token file
tf="$HOME/.token"

# Check if the file exists
if [ -e "$tf" ]; then
    # Get the current permissions of the file in octal format
    fp=$(stat -c "%a" "$tf")

    # Check if the permissions are different from 600
    if [ "$fp" -ne 600 ]; then
        echo "Warning: .token file has too open permissions"
    fi
fi

# echo the date UTC time
date --iso-8601=seconds


# Clean tmp
tmp="$HOME/tmp"
if [ ! -e $tmp ]; then
    echo "tmp does not exist"
else
    rm -rf "$tmp"/*
fi

# Custom functions
function mkcd() {
    mkdir -p "$1"
    cd "$1"
}

# Set the umask
umask 0006

# Kill the 8080 port related process
fuser -k 8080/tcp

# Conditional statements
if [ "$(uname)" == "Darwin" ]; then
    # macOS specific settings
    export PATH=$PATH:/usr/local/bin
    alias ls='ls -G'
else
    # Linux specific settings
    alias ls='ls --color=auto'
fi

# Adding user-specific bin directories to PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:/home/$USER/usercommands

# Load nvm (Node Version Manager)
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Set JAVA_HOME (example for Java JDK installation)
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

# Source global definitions (if any)
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

