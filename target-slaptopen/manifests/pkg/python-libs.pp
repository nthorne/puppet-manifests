class target-slaptopen::pkg::python-libs {
  package {"python-matplotlib":
    ensure => installed,
  }

  package {"python-numpy":
    ensure => installed,
  }

  package {"python-pip":
    ensure => installed,
  }

  package {"python-virtualenv":
    ensure => installed,
  }
}
