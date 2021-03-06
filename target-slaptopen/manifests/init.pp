class target-slaptopen {
  # Configurations
  #include target-slaptopen::cfg::ssh-keys

  # Common packages
  include common::pkg::ipython
  include common::pkg::pylint

  # Generated packages
  #include target-slaptopen::generated::bankid
  #include target-slaptopen::generated::rust

  # Target specific packages
  #include target-slaptopen::pkg::anki
  include target-slaptopen::pkg::calibre
  include target-slaptopen::pkg::chromium-browser
  include target-slaptopen::pkg::clamtk
  #include target-slaptopen::pkg::cryptsetup
  include target-slaptopen::pkg::dart
  include target-slaptopen::pkg::deluge-gtk
  include target-slaptopen::pkg::dropbox
  include target-slaptopen::pkg::easytag
  #include target-slaptopen::pkg::enigmail
  include target-slaptopen::pkg::filezilla
  include target-slaptopen::pkg::freemind
  include target-slaptopen::pkg::ghc
  include target-slaptopen::pkg::git
  include target-slaptopen::pkg::gnupg
  include target-slaptopen::pkg::goappengine
  include target-slaptopen::pkg::golang
  #include target-slaptopen::pkg::gollum-wiki
  #include target-slaptopen::pkg::keepassx
  include target-slaptopen::pkg::mercurial
  include target-slaptopen::pkg::moc
  include target-slaptopen::pkg::mplayer
  include target-slaptopen::pkg::plantuml
  include target-slaptopen::pkg::python-libs
  include target-slaptopen::pkg::samba
  include target-slaptopen::pkg::screen
  include target-slaptopen::pkg::soundconverter
  include target-slaptopen::pkg::spideroak
  #include target-slaptopen::pkg::ticgit
  include target-slaptopen::pkg::tmux
  include target-slaptopen::pkg::todotxt
  include target-slaptopen::pkg::usbutils
  include target-slaptopen::pkg::vim-gnome
  include target-slaptopen::pkg::virtualbox
  include target-slaptopen::pkg::wine
  include target-slaptopen::pkg::xmonad
  include target-slaptopen::pkg::xterm
  include target-slaptopen::pkg::zsh
  include target-slaptopen::pkg::silversearcher-ag
  include target-slaptopen::pkg::rust
  include common::pkg::curl
  include target-slaptopen::pkg::scala
  include target-slaptopen::pkg::afuse
  include target-slaptopen::pkg::sshfs
  include target-slaptopen::pkg::shellcheck
  include target-slaptopen::pkg::geeknote
  include target-slaptopen::pkg::nix
  include target-slaptopen::pkg::direnv
  include target-slaptopen::scripts::mksbt
}
