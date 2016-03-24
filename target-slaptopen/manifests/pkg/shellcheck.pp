class target-slaptopen::pkg::shellcheck {
  include target-slaptopen::pkg::cabal

  exec {"cabal-update":
    require => Package["cabal-install"],
    command => "cabal update",
    path => ["/bin", "/usr/bin", "/usr/sbin"],
    user => $user,
    group => $group,
  }

  exec {"shellcheck-install":
    require => Exec["cabal-update"],
    creates => "${home}/.cabal/bin/shellcheck",
    command => "cabal install shellcheck",
    path => ["/bin", "/usr/bin", "/usr/sbin"],
    user => $user,
    group => $group,
    logoutput => true,
  }

  file {"${home}/.cabal/bin/shellcheck":
    require => Exec["shellcheck-install"],
    ensure => file,
    force => true,
    owner => $user,
    group => $group,
  }
}
