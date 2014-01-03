class common::pkg::zsh {
  package {"zsh":
    ensure => installed,
  }

  # this is not entirely synced, but as close as we can get
  notify {"changing-shell":
    require => Package["zsh"],
    before => Exec["chsh-zsh"],
    message => "Changing default shell to zsh",
  }

  exec {"chsh-zsh":
    require => Package["zsh"],
    command => "chsh -s $(command -v zsh) ${user}",
    path => ["/bin", "/usr/bin", "/usr/sbin"],
    user => root,
    group => root,
    logoutput => true,
  }
}
