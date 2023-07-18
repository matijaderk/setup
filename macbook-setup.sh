# 1. Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export PATH="/opt/homebrew/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"

# 2. Install brew packages
brew install node
brew install git
brew install yarn
brew install python@3.8
brew install wget
brew install jq

# 3. Install VS Code exstensions
# 3 - General
code --install-extension alefragnani.Bookmarks
code --install-extension christian-kohler.path-intellisense
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension ionutvmi.path-autocomplete
code --install-extension naumovs.color-highlight
code --install-extension shardulm94.trailing-spaces
code --install-extension wayou.vscode-todo-highlight
# 3.2 - Themes
code --install-extension alekangelov.alek-kai-theme
code --install-extension smukkekim.theme-setimonokai
# 3.2 - Git
code --install-extension donjayamanne.githistory
code --install-extension eamodio.gitlens
code --install-extension mhutchie.git-graph
code --install-extension waderyan.gitblame
# 3.3 - JS
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension HookyQR.beautify
code --install-extension kisstkondoros.typelens
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension VisualStudioExptTeam.vscodeintellicode-completions
# 3.4 - C#
code --install-extension ms-dotnettools.csdevkit
# 3.5 - SQL
code --install-extension ms-mssql.mssql
code --install-extension cweijan.vscode-postgresql-client2

# 4. Download VS Code settings file
wget -O "$HOME/Library/Application Support/Code/User/settings.json" https://raw.githubusercontent.com/matijaderk/setup/master/vscode-settings
