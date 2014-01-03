class target-slaptopen::src::repos {
  file {"${home}/repos":
    ensure => "directory",
    mode => 0644,
    owner => $user,
    group => $group,
  }
}
