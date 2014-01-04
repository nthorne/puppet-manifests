class common::pkg::samba {
  package {"samba":
    ensure => installed,
  }

  notify {"set-samba-password":
    require => Package["samba"],
    before => Exec["smbpasswd"],
    message => "Changing samba share password",
  }

  exec {"smbpasswd":
    require => Package["samba"],
    command => "smbpasswd -a ${user}",
    path => ["/bin", "/usr/bin", "/usr/sbin"],
    user => root,
    group => root,
    logoutput => true,
  }
}
