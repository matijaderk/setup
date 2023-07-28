#!/usr/bin/env bash
chapterEcho() {
  echo ' '
  echo '#########################'
  echo $1
  echo '#########################'
  echo ' '
}

#################
### PRE SETUP ###
#################
chapterEcho '1. PRE SETUP starting...'

sudo apt-get update
sudo apt-get upgrade -y
sudo apt install libpango1.0-0

chapterEcho '1. PRE SETUP complete...'

#################
### DEB/SNAP FILES ###
#################
chapterEcho '2. DEB FILES starting...'

# 2.1. GitKraken
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i gitkraken-amd64.deb

# 2.2. VS Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt-get update
sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install code -y

# 2.3. Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# 2.4. Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install yarn -y

# 2.5 Slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.16.0-amd64.deb
sudo apt-get install ./slack-desktop-*.deb

# 2.6 Dropbox
wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2020.03.04_amd64.deb
sudo dpkg -i *dropbox_*.deb

# 2.7. Update
sudo apt-get update
sudo apt-get upgrade -y

chapterEcho '2. DEB FILES complete...'

####################
### APT PACKAGES ###
####################
chapterEcho '3. APT PACKAGES starting...'

# 3.1. Node
sudo apt-get remove nodejs
sudo apt-get remove npm
sudo rm -rf /usr/local/bin/npm
sudo rm -rf /usr/local/share/man/man1/node*
sudo rm -rf /usr/local/lib/dtrace/node.d
rm -rf ~/.npm
rm -rf ~/.node-gyp
sudo rm -rf /opt/local/bin/node
sudo rm -rf /opt/local/include/node
sudo rm -rf /opt/local/lib/node_modules
sudo rm -rf /usr/local/lib/node*
sudo rm -rf /usr/local/include/node*
sudo rm -rf /usr/local/bin/node*

sudo apt autoremove -y

curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs

# 3.4 psensor, thunderbird, cheese
sudo apt-get -y install psensor
sudo apt-get -y install thunderbird
sudo apt-get -y install cheese

chapterEcho '3. APT PACKAGES complete...'

##################
### POST-SETUP ###
##################
chapterEcho '4. POST-SETUP starting...'

# 4.1. VS Code exstensions
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

# 4.2 Download VS Code settings file
wget -O "$HOME/.config/Code/User/settings.json" https://raw.githubusercontent.com/matijaderk/setup/master/vscode-settings

# 4.3 Set default CPU colors
gsettings set org.gnome.gnome-system-monitor cpu-colors "[(uint32 0, 'rgb(114,159,207)'), (1, 'rgb(114,159,207)'), (2, 'rgb(114,159,207)'), (3, 'rgb(114,159,207)'), (4, 'rgb(114,159,207)'), (5, 'rgb(114,159,207)'), (6, 'rgb(114,159,207)'), (7, 'rgb(114,159,207)'), (8, 'rgb(114,159,207)'), (9, 'rgb(114,159,207)'), (10, 'rgb(114,159,207)'), (11, 'rgb(114,159,207)'), (12, 'rgb(114,159,207)'), (13, 'rgb(114,159,207)'), (14, 'rgb(114,159,207)'), (15, 'rgb(114,159,207)'), (16, 'rgb(114,159,207)')]"

# 4.4 Clean up files
rm *.deb
rm *.gpg

sudo apt-get update
sudo apt-get -y upgrade

chapterEcho '4. POST-SETUP complete...'
