# Public Folder Documentation

The `public` folder is intended for users to edit shell scripts and update the `Brewfile`. This folder allows easy customization of scripts and system configurations, making it user-friendly for updates and command additions.

## Folder Contents

1. **Shell Scripts**:
   - Users can add their own custom shell scripts in this folder.
   - These scripts can be used to automate tasks, install software, or configure the system.
   - Example: You can create scripts for running common commands, such as updating packages or setting up environments.
   
   In the `public` folder, there are **3 important shell script files**:
   
   - **`my_zshrc`**:
     - This file allows users to define custom commands and configurations that will be added to the `.zshrc` file.
     - It is typically used for environment settings, aliases, functions, or any other commands that should be loaded when starting a new Zsh session.
   
   - **`my_zprofile`**:
     - Similar to the `my_zshrc` file, this file is for customizations that will be added to the `.zprofile` file.
     - This is the place to add environment variables or other configurations that should be executed during the login shell (before starting the interactive session).

   - **`my_alias`**:
     - The `my_alias` file is used for adding custom alias commands that will be executed via the `sm` command.
     - Users can define aliases for common commands or frequently used scripts.
     - Example: Adding a command like `alias sm_update="brew update && brew upgrade && brew cleanup"` would allow the user to execute a complete update with a simple `sm_update` command.

2. **Brewfile**:
   - The `Brewfile` is used by Homebrew to manage dependencies and packages.
   - Users can edit the `Brewfile` to add or remove Homebrew packages, casks, and taps.
   - Example: You can use the `sm` command to manage your brew packages.