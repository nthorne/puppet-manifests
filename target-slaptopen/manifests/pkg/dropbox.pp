class target-slaptopen::pkg::dropbox {
#  package {"dropbox":
#    ensure => installed,
#  }

  file { "/etc/init.d/dropbox":
#    require =>  Package["dropbox"],
    mode => 0755,
    owner => "root",
    group => "root",
    source  => "puppet:///modules/target-slaptopen/dropbox",
  }

  exec { "dropbox-rc-update":
    require => File["/etc/init.d/dropbox"],
    command => "update-rc.d dropbox defaults; /etc/init.d/dropbox start",
    path => ["/bin", "/sbin", "/usr/bin", "/usr/sbin"],
    user => "root",
    group => "root",
    logoutput => true,
  }
}
