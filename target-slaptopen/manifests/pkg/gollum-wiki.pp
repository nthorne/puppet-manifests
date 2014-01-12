class target-slaptopen::pkg::gollum-wiki {
  package {"ruby-dev":
    ensure => installed,
  }

  package {"libicu-dev":
    ensure => installed,
  }

  package {"g++":
    ensure => installed,
  }

  exec {"install-gollum-wiki":
    require => [Package["ruby-dev"], Package["libicu-dev"], Package["g++"]],
    creates => "/usr/local/bin/gollum",
    command => "gem install gollum",
    path => ["/bin", "/sbin", "/usr/bin", "/usr/sbin"],
    user => "root",
    group => "root",
    logoutput => true,
  }
}
