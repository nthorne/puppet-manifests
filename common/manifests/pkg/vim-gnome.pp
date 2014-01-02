class common::pkg::vim-gnome {
  include common::pkg::vim

  package {"vim-gnome":
    require => Package["vim"],
    ensure => installed,
  }
}
