class target-slaptopen::pkg::virtualbox {
  package {"virtualbox":
    ensure => installed,
  }

  package {"virtualbox-qt":
    ensure => installed,
  }

  package {"virtualbox-dkms":
    ensure => installed,
  }
}
