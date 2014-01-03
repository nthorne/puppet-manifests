class target-slaptopen::pkg::vim-gnome {
  include target-slaptopen::pkg::vim

  package {"vim-gnome":
    require => Package["vim"],
    ensure => installed,
  }
}
