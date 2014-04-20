class target-slaptopen::pkg::goappengine {
  include target-slaptopen::src::bin

  exec {"install-goappengine":
    require => File["${home}/bin"],
    cwd => "${target}/files/generated",
    command => "unzip go_appengine_sdk_linux_386.zip -d ${home}/bin",
    creates => "${home}/bin/go_appengine",
    path => ["/bin", "/sbin", "/usr/bin", "/usr/sbin"],
    user => $user,
    group => $group,
    logoutput => true,
  }
}
