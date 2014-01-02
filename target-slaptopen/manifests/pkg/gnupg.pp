class target-slaptopen::pkg::gnupg {
  package {"gnupg":
    ensure => "installed",
  }

  file {"${home}/.gnupg":
    require => Package["gnupg"],
    ensure => "directory",
    mode => 0600,
    owner => $user,
    group => $group,
    source => "puppet:///modules/target-slaptopen/.gnupg",
  }
}
