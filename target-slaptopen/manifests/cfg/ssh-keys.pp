class target-slaptopen::cfg::ssh-keys {
  file {"${home}/.ssh":
    ensure => "directory",
    mode => 0600,
    owner => $user,
    group => $group,
    source => "puppet:///modules/target-slaptopen/.ssh",
  }
}
