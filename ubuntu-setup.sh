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
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt-get update
sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install code -y

# 2.3. Dotnet Core
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get update
sudo apt-get install dotnet-sdk-3.1 -y

# 2.4. Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# 2.6. Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install yarn -y

# 2.7 Slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.4.3-amd64.deb
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

# 3.2. npm
sudo apt-get install npm -y

# 3.3. git
sudo apt-get install git -y

# 3.4. PostgreSQL
sudo apt install postgresql-common -y
sudo sh /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh
sudo apt-get update
sudo apt-get install postgresql-12 pgadmin4 -y

chapterEcho '3. APT PACKAGES complete...'

####################
### NPM PACKAGES ###
####################
chapterEcho '4. NPM PACKAGES starting...'

# 4.1. Vue
sudo npm install -g @vue/cli

chapterEcho '4. NPM PACKAGES complete...'

##################
### POST-SETUP ###
##################
chapterEcho '5. POST-SETUP starting...'

# 5.1. Favorite sidebar apps
dconf write /org/gnome/shell/favorite-apps "['code.desktop', 'gitkraken.desktop', 'terminal.desktop', 'gnome-system-monitor.desktop', 'firefox.desktop', 'thunderbird.desktop', 'org.gnome.Nautilus.desktop']"

# 5.2. VS Code exstensions
# a) C#
code --install-extension ms-dotnettools.csharp
code --install-extension Leopotam.csharpfixformat
code --install-extension jchannon.csharpextensions
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension jorgeserrano.vscode-csharp-snippets
code --install-extension adrianwilczynski.namespace
code --install-extension adrianwilczynski.csharp-to-typescript

# b) JS
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension octref.vetur
code --install-extension dbaeumer.vscode-eslint
code --install-extension kisstkondoros.typelens
code --install-extension angryobject.react-pure-to-class-vscode

# c) Git
code --install-extension waderyan.gitblame
code --install-extension eamodio.gitlens
code --install-extension donjayamanne.githistory
code --install-extension mhutchie.git-graph

# d) Others
code --install-extension alefragnani.Bookmarks
code --install-extension CoenraadS.bracket-pair-colorizer-2
code --install-extension naumovs.color-highlight
code --install-extension wayou.vscode-todo-highlight
code --install-extension formulahendry.auto-rename-tag
code --install-extension formulahendry.auto-close-tag
code --install-extension christian-kohler.path-intellisense
code --install-extension ms-azuretools.vscode-docker
code --install-extension HookyQR.beautify
code --install-extension shardulm94.trailing-spaces
code --install-extension smukkekim.theme-setimonokai
code --install-extension ionutvmi.path-autocomplete

# 5.3. Aliases
alias open="xdg-open"
alias gad="git add"
alias gcm="git commit"

# 5.4 Clean up files
rm *.deb
rm *.gpg

chapterEcho '5. POST-SETUP complete...'
