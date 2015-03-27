class target-devdroplet::src::repos {
  file {"${home}/repos":
    ensure => "directory",
    mode => 0644,
    owner => $user,
    group => $group,
  }
}
