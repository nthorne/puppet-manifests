class target-slaptopen::pkg::spideroak {
  package {"spideroak":
    ensure => "installed",
    provider => "dpkg",
    source => "${target}/files/generated/spideroak.deb",
  }
}
