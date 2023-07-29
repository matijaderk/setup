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
code --install-extension akamud.vscode-theme-onedark
code --install-extension aldijav.golangwithdidi
code --install-extension alefragnani.Bookmarks
code --install-extension alekangelov.alek-kai-theme
code --install-extension azemoh.one-monokai
code --install-extension christian-kohler.path-intellisense
code --install-extension christophwolff.sublime-oceanic-after-next-theme
code --install-extension dbaeumer.vscode-eslint
code --install-extension donjayamanne.githistory
code --install-extension dracula-theme.theme-dracula
code --install-extension eamodio.gitlens
code --install-extension enkia.tokyo-night
code --install-extension Equinusocio.vsc-community-material-theme
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension formulahendry.code-runner
code --install-extension Fudge.auto-using
code --install-extension GitHub.github-vscode-theme
code --install-extension golang.go
code --install-extension HookyQR.beautify
code --install-extension ionutvmi.path-autocomplete
code --install-extension janisdd.vscode-edit-csv
code --install-extension jorgeserrano.vscode-csharp-snippets
code --install-extension KevinRose.vsc-python-indent
code --install-extension kisstkondoros.typelens
code --install-extension kreativ-software.csharpextensions
code --install-extension mhutchie.git-graph
code --install-extension ms-dotnettools.csdevkit
code --install-extension ms-dotnettools.csharp
code --install-extension ms-dotnettools.vscode-dotnet-runtime
code --install-extension ms-dotnettools.vscodeintellicode-csharp
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension naumovs.color-highlight
code --install-extension neonxp.gotools
code --install-extension nhoizey.gremlins
code --install-extension premparihar.gotestexplorer
code --install-extension revrenlove.c-sharp-utilities
code --install-extension sdras.night-owl
code --install-extension shardulm94.trailing-spaces
code --install-extension SmukkeKim.theme-setimonokai
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension svipas.prettier-plus
code --install-extension VisualStudioExptTeam.intellicode-api-usage-examples
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension waderyan.gitblame
code --install-extension wayou.vscode-todo-highlight
code --install-extension whizkydee.material-palenight-theme
code --install-extension zaaack.markdown-editor
code --install-extension zhuangtongfa.material-theme
code --install-extension zxh404.vscode-proto3

# 4. Download VS Code settings file
wget -O "$HOME/Library/Application Support/Code/User/settings.json" https://raw.githubusercontent.com/matijaderk/setup/master/vscode-settings
