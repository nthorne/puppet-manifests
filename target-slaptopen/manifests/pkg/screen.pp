class target-slaptopen::pkg::screen {
  include target-slaptopen::pkg::git
  include common::pkg::screen
  include target-slaptopen::src::repos

  file {"${home}/.screenrc":
    require => Exec["clone-screen-environment"],
    ensure => link,
    force => true,
    target => "${home}/repos/nthorne-screen-environment/work/.screenrc",
    owner => $user,
    group => $group,
  }

  exec {"clone-screen-environment":
    require => [Package["git"], File["${home}/repos"], Package["screen"]],
    cwd => "${home}/repos",
    creates => "${home}/repos/nthorne-screen-environment",
    command => "git clone --recursive http://github.com/nthorne/nthorne-screen-environment.git",
    path => ["/bin", "/usr/bin", "/usr/sbin"],
    user => $user,
    group => $group,
    logoutput => true,
  }
}
