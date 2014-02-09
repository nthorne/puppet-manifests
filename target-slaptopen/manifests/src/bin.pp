class target-slaptopen::src::bin {
  file {"${home}/bin":
    ensure => "directory",
    mode => 0644,
    owner => $user,
    group => $group,
  }
}
