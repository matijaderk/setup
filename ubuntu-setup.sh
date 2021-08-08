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
sudo apt-get install curl -y
sudo apt-get install libappindicator1 libdbusmenu-gtk4 python-is-python2 -y
sudo apt-get install gconf-service gconf-service-backend gconf2 gconf2-common libgconf-2-4 -y

chapterEcho '1. PRE SETUP complete...'

#################
### DEB FILES ###
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

# 2.3. Dotnet Core
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get update
sudo apt-get install dotnet-sdk-5.0 -y

# 2.4. Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# 2.6. Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install yarn -y

# 2.7 Slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.16.0-amd64.deb
sudo apt-get install ./slack-desktop-*.deb

# 2.8 Dropbox
wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2020.03.04_amd64.deb
sudo dpkg -i *dropbox_*.deb

chapterEcho '2. DEB FILES complete...'

####################
### APT PACKAGES ###
####################
chapterEcho '3. APT PACKAGES starting...'

# 3.1. Node
sudo apt-get install nodejs -y

# 3.2. wget
sudo apt-get install wget -y

# 3.3. git
sudo apt-get install git -y

# 3.4. PostgreSQL
sudo apt install postgresql-common -y
sudo sh /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh
sudo apt-get update
sudo apt-get install postgresql-12 pgadmin4 -y

chapterEcho '3. APT PACKAGES complete...'

##################
### POST-SETUP ###
##################
chapterEcho '4. POST-SETUP starting...'

# 4.1. Favorite sidebar apps
dconf write /org/gnome/shell/favorite-apps "['code.desktop', 'gitkraken.desktop', 'terminal.desktop', 'gnome-system-monitor.desktop', 'firefox.desktop', 'thunderbird.desktop', 'org.gnome.Nautilus.desktop']"

# 4.2. VS Code exstensions
# a) C#
code --install-extension adrianwilczynski.csharp-to-typescript
code --install-extension adrianwilczynski.namespace
code --install-extension jchannon.csharpextensions
code --install-extension jorgeserrano.vscode-csharp-snippets
code --install-extension Leopotam.csharpfixformat
code --install-extension ms-dotnettools.csharp
code --install-extension VisualStudioExptTeam.vscodeintellicode

# b) JS
code --install-extension angryobject.react-pure-to-class-vscode
code --install-extension dbaeumer.vscode-eslint
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension kisstkondoros.typelens
code --install-extension octref.vetur
code --install-extension ms-vscode.vscode-typescript-tslint-plugin

# c) Git
code --install-extension donjayamanne.githistory
code --install-extension eamodio.gitlens
code --install-extension mhutchie.git-graph
code --install-extension waderyan.gitblame

# d) Others
code --install-extension alefragnani.Bookmarks
code --install-extension christian-kohler.path-intellisense
code --install-extension CoenraadS.bracket-pair-colorizer-2
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension HookyQR.beautify
code --install-extension ionutvmi.path-autocomplete
code --install-extension ms-azuretools.vscode-docker
code --install-extension naumovs.color-highlight
code --install-extension shardulm94.trailing-spaces
code --install-extension smukkekim.theme-setimonokai
code --install-extension alekangelov.alek-kai-theme
code --install-extension wayou.vscode-todo-highlight

# 4.3 Download VS Code settings file
wget -O "$HOME/.config/Code/User/settings.json" https://raw.githubusercontent.com/matijaderk/setup/master/vscode-settings

# 4.4. Aliases
alias open="xdg-open"

# 4.5. Customize Ubuntu settings
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32

# 4.6 Set default wallpaper
wget -O /tmp/wallpaper.jpg "https://raw.githubusercontent.com/matijaderk/setup/master/Wallpaper.jpg"
gsettings set org.gnome.desktop.background picture-uri file:////tmp/wallpaper.jpg

# 4.6 Clean up files
rm *.deb
rm *.gpg

chapterEcho '4. POST-SETUP complete...'
