class target-slaptopen {
  # Configurations
  include target-slaptopen::cfg::ssh-keys

  # Packages
  include common::pkg::vim-gnome

  include target-slaptopen::pkg::git
  include target-slaptopen::pkg::gnupg
}
