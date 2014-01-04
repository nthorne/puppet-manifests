class target-slaptopen::pkg::samba {
  include common::pkg::samba

  file {"${home}/shared":
    ensure => "directory",
    mode => 0644,
    owner => $user,
    group => $group,
  }

  file { "/etc/samba/smb.conf":
    require =>  [Package["samba"], File["${home}/shared"]],
    source  => "puppet:///modules/target-slaptopen/smb.conf",
  }

  file { "/etc/samba/smbusers":
    before => File["/etc/samba/smb.conf"],
    require =>  Package["samba"],
    source  => "puppet:///modules/target-slaptopen/smbusers",
  }
}
