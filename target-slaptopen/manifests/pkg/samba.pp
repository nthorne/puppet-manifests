class target-slaptopen::pkg::samba {
  include common::pkg::samba

  file { "/etc/samba/smb.conf":
    require =>  Package["samba"],
    source  => "puppet:///modules/target-slaptopen/smb.conf",
  }

  file { "/etc/samba/smbusers":
    require =>  Package["samba"],
    source  => "puppet:///modules/target-slaptopen/smbusers",
  }
}
