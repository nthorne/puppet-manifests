class target-slaptopen::pkg::cabal {
  package {"cabal-install":
    ensure => installed,
  }
}
