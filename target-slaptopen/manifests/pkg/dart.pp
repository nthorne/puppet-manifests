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

  exec {"symlink-libudev":
    require => Exec["install-dart"],
    cwd => "/lib/i386-linux-gnu",
    command => "ln -s libudev.so.1 libudev.so.0",
    creates => "/lib/i386-linux-gnu/libudev.so.0",
    path => ["/bin", "/sbin", "/usr/bin", "/usr/sbin"],
    user => "root",
    group => "root",
    logoutput => true,
  }
}
