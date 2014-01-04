class target-slaptopen::pkg::bankid {
  exec {"install-bankid":
    cwd => "${files}/generated/BISP-*",
    command => "install.*.sh i",
    path => ["/bin", "/usr/bin", "/usr/sbin"],
    user => "root",
    group => "root",
    logoutput => true,
  }
}
