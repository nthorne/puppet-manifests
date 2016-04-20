class target-slaptopen::scripts::mksbt {
  include target-slaptopen::pkg::scala
  include target-slaptopen::src::bin


  file {"${home}/bin/mksbt.sh":
    require => [File["${home}/bin"], Package["scala"]],
    group => $group,
    mode => 0744,
    source => "puppet:///modules/target-slaptopen/mksbt.sh",
  }
}
