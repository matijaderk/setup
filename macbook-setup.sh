# 1. Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Install brew packages
brew install node
brew install git
brew install yarn
brew install python@3.8
brew install wget
brew install jq

# 3. Install VS Code exstensions
# 3.a) JS
code --install-extension angryobject.react-pure-to-class-vscode
code --install-extension dbaeumer.vscode-eslint
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension kisstkondoros.typelens
code --install-extension octref.vetur
code --install-extension ms-vscode.vscode-typescript-tslint-plugin

# 3.b) Git
code --install-extension donjayamanne.githistory
code --install-extension eamodio.gitlens
code --install-extension mhutchie.git-graph
code --install-extension waderyan.gitblame

# 3.c) Others
code --install-extension alefragnani.Bookmarks
code --install-extension christian-kohler.path-intellisense
code --install-extension CoenraadS.bracket-pair-colorizer-2
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension HookyQR.beautify
code --install-extension ionutvmi.path-autocomplete
code --install-extension naumovs.color-highlight
code --install-extension shardulm94.trailing-spaces
code --install-extension smukkekim.theme-setimonokai
code --install-extension wayou.vscode-todo-highlight

# 4. Download VS Code settings file
wget -O "$HOME/Library/Application Support/Code/User/settings.json" https://raw.githubusercontent.com/matijaderk/setup/master/vscode-settings
