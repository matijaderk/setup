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

# 4.1.1 - General
code --install-extension alefragnani.Bookmarks
code --install-extension christian-kohler.path-intellisense
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension ionutvmi.path-autocomplete
code --install-extension naumovs.color-highlight
code --install-extension shardulm94.trailing-spaces
code --install-extension wayou.vscode-todo-highlight
# 4.1.2 - Themes
code --install-extension alekangelov.alek-kai-theme
code --install-extension smukkekim.theme-setimonokai
# 4.1.2 - Git
code --install-extension donjayamanne.githistory
code --install-extension eamodio.gitlens
code --install-extension mhutchie.git-graph
code --install-extension waderyan.gitblame
# 4.1.3 - JS
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension HookyQR.beautify
code --install-extension kisstkondoros.typelens
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension VisualStudioExptTeam.vscodeintellicode-completions
# 4.1.4 - C#
code --install-extension ms-dotnettools.csdevkit
# 4.1.5 - SQL
code --install-extension ms-mssql.mssql
code --install-extension cweijan.vscode-postgresql-client2

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
