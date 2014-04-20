class target-slaptopen::pkg::dart {
  include target-slaptopen::src::bin

  exec {"install-dart":
    require => File["${home}/bin"],
    cwd => "${target}/files/generated",
    command => "unzip darteditor-linux-ia32.zip -d ${home}/bin",
    creates => "${home}/bin/dart",
    path => ["/bin", "/sbin", "/usr/bin", "/usr/sbin"],
    user => $user,
    group => $group,
    logoutput => true,
  }
}
