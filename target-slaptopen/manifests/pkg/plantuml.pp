class target-slaptopen::pkg::plantuml {
  package {"pandoc":
    ensure => installed,
  }

  package {"graphviz":
    ensure => installed,
  }

  exec {"install-plantuml":
    require => [Package["pandoc"], Package["graphviz"]],
    creates => "${home}/bin/plantuml.jar",
    cwd => "${target}/files/generated",
    command => "cp plantuml.jar ${home}/bin/plantuml.jar",
    path => ["/bin", "/sbin", "/usr/bin", "/usr/sbin"],
    user => $user,
    group => $group,
    logoutput => true,
  }
}
