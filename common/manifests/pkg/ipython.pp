class common::pkg::ipython {
  package {"ipython":
    ensure => installed,
  }

  package {"ipython-notebook":
    require => Package["ipython"],
    ensure => installed,
  }
}
