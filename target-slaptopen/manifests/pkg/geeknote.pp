class target-slaptopen::pkg::geeknote {
  include target-slaptopen::pkg::git
  include target-slaptopen::src::repos

  exec {"clone-geeknote":
    require => [Package["git"], File["${home}/repos"]],
    cwd => "${home}/repos",
    creates => "${home}/repos/geeknote",
    command => "git clone --recursive git://github.com/VitaliyRodnenko/geeknote.git",
    path => ["/bin", "/usr/bin", "/usr/sbin"],
    user => $user,
    group => $group,
    logoutput => true,
  }

  exec {"geeknote":
    require => Exec["clone-geeknote"],
    cwd => "${home}/repos/geeknote",
    creates => "/usr/local/bin/geeknote",
    command => "python setup.py install",
    path => ["/bin", "/usr/bin", "/usr/sbin"],
    logoutput => true,
  }
}
