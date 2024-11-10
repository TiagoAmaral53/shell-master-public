#################### display helper ####################

echo "\033[2;37mhint: sm for available commands\033[0m"

#################### set global variables ####################
export WORKSPACE="$HOME/workspace"
export SHELLMASTER_PUBLIC="$SHELLMASTER/public"

#################### HOSTS ####################
alias sm_host="sudo code /private/etc/hosts"

#################### clear console ####################
alias clear="printf \"\033c\""


#################### Brew ####################
alias sm_brewUpdate="cd $SHELLMASTER_PUBLIC && brew update && brew upgrade && brew cleanup && cd -"
alias sm_outdated="cd $SHELLMASTER_PUBLIC && brew outdated && cd -"
alias sm_brewBackup="confirm_and_run 'rm -f $SHELLMASTER_PUBLIC/Brewfile && brew bundle dump --file=$SHELLMASTER_PUBLIC/Brewfile'"
alias sm_bundle="confirm_and_run 'brew bundle --file=$SHELLMASTER_PUBLIC/Brewfile'"

#################### Define functions ####################
# Function to colorize command names
color() {
  local command_name="$1"
  echo "\033[1;31m$command_name\033[0m"  # Change color as needed
}

# Function to confirm operations
confirm_and_run() {
    local cmd="$1"
    
    # validate command
    if [[ -z "$cmd" ]]; then
        echo "Error: missing cmd argument."
        return 1
    fi

    echo "Do you confirm the operation '$cmd'? (y/n)"
    read input
    if [[ "$input" =~ ^[yY]$ ]]; then
        eval "$cmd"
    else
        echo "Operation cancelled...."
    fi
}

#################### Define the "run" alias to list all available commands ####################

alias sm="echo '\
\033[1;34mWelcome to shell-master $USER!\033[0m

Available commands:
    Globals:
        $(color '$HOME')                        - Path to $HOME 
        $(color '$WORKSPACE')                   - Path to $WORKSPACE
    System:
        $(color 'sm')                           - Display this list of available commands
        $(color 'sm_host')                      - Open the host files
        $(color 'clear')                        - Clear the terminal
    Brew:
        $(color 'sm_brewUpdate')                - Updates all brew packages and removes old versions
        $(color 'sm_outdated')                  - Shows all outdated packages and casks
        $(color 'sm_brewBackup')                - Create a Brewfile in your user directory with your brew installed packages
        $(color 'sm_bundle')                    - Reinstall all packages listed in your Brewfile
'"

alias shell-master="sm"