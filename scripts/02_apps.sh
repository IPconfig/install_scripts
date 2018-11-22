install_brew_apps() {
  brew install ffmpeg --with-faac --with-libvpx --with-libvorbis --with-openssl --with-theora --with-x265
  brew install asciinema asciinema2gif # install terminal screen recorder
  brew install exiftool # R/W exif information
  brew install git git-extras ghi # git from the commandline
  brew install ctags
  brew install hr # horizontal ruler for the terminal
  brew install duti # needed later to set default app for extensions
  brew install mas # mac app store from the command line
}

install_cask_apps() {
  renew_sudo # to make the Caskroom on first install
  brew cask install cyberduck docker dropbox github handbrake iina microsoft-office onyx postman steam telegram tunnelblick visual-studio-code whatsapp xact

  # install alternative versions
  brew tap caskroom/versions
  brew cask install firefox-beta

  # prefpanes, qlplugins, colorpickers
  brew cask install epubquicklook qlcolorcode qlimagesize qlstephen ttscoff-mmd-quicklook qlmarkdown qlplayground qlprettypatch qlvideo quicklook-csv quicklook-json
}

install_fonts() {
  brew tap caskroom/fonts
  brew cask install font-fira-code # see https://github.com/tonsky/FiraCode
}

install_mas_apps() {
  readonly local mas_apps=('1password=443987910' 'WiFi Scanner=411680127' 'The Unarchiver=425424353' 'Haskell for Mac=841285201' 'Xcode=497799835')
  mas signin "${mas_email}" "${mas_password}"

  for app in "${mas_apps[@]}"; do
    local app_id="${app#*=}"
    mas install "${app_id}"
  done
}