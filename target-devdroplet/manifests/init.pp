class target-devdroplet {
  # Target specific packages
  include target-devdroplet::pkg::git
  include target-devdroplet::pkg::tmux
  include target-devdroplet::pkg::vim
  include target-devdroplet::pkg::zsh
}
