class target-slaptopen::pkg::pandoc {
  package {"pandoc":
    ensure => installed,
  }

  package {"graphviz":
    ensure => installed,
  }
}
