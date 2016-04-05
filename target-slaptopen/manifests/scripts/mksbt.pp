class target-slaptopen::scripts::mksbt {
  include target-slaptopen::pkg::scala
  include target-slaptopen::src::bin

  exec {"install-mksbt.sh":
    require => [File["${home}/bin"], Package["scala"]],
    cwd => "${home}/bin",
    creates => "${home}/bin/mksbt.sh",
    user => $user,
    group => $group,
    logoutput => true,
    mode => 0744,
    source => "puppet:///modules/target-slaptopen/mksbt.sh",
  }
}
