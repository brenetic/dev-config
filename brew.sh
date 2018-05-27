#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew tap homebrew/versions
brew install bash-completion2

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install macvim --with-cscope --with-lua --override-system-vim --with-luajit --with-python3
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

brew install mongodb
brew install mysql
brew install netpbm
brew install nmap
brew install node
brew install nvm
brew install pngcheck
brew install redis
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install tmux

brew install ack
brew install dark-mode
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rhino
brew install speedtest_cli
brew install ssh-copy-id
brew install tree
brew install webkit2png
brew install zopfli
brew install httpie

# Install native apps
brew tap phinze/homebrew-cask
brew install brew-cask

function install_with_cask() {
	if brew cask info "${@}" | grep "Not installed" > /dev/null; then
			brew cask install "${@}"
	else
			echo "${@} is already installed."
	fi
}

install_with_cask appcleaner
install_with_cask caffeine
install_with_cask ccleaner
install_with_cask dropbox
install_with_cask firefox
install_with_cask flux
install_with_cask google-chrome
install_with_cask google-chrome-canary
install_with_cask google-drive
install_with_cask iconping
install_with_cask imagealpha
install_with_cask imageoptim
install_with_cask intellij-idea
install_with_cask iterm2
install_with_cask macvim
install_with_cask miro-video-converter
install_with_cask shiftit
install_with_cask skype
install_with_cask slack
install_with_cask sourcetree
install_with_cask spotify
install_with_cask sublime-text3
install_with_cask the-unarchiver
install_with_cask tor-browser
install_with_cask virtualbox
install_with_cask vlc

# Remove outdated versions from the cellar.
brew cleanup

brew doctor
