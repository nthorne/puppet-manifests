class target-devdroplet::pkg::tmux {
  include target-devdroplet::pkg::git
  include common::pkg::tmux
  include target-devdroplet::src::repos

  file {"${home}/.tmux.conf":
    require => Exec["clone-tmux-environment"],
    ensure => link,
    force => true,
    target => "${home}/repos/nthorne-tmux-environment/.tmux.conf",
    owner => $user,
    group => $group,
  }

  exec {"clone-tmux-environment":
    require => [Package["git"], File["${home}/repos"], Package["tmux"]],
    cwd => "${home}/repos",
    creates => "${home}/repos/nthorne-tmux-environment",
    command => "git clone --recursive http://github.com/nthorne/nthorne-tmux-environment.git",
    path => ["/bin", "/usr/bin", "/usr/sbin"],
    user => $user,
    group => $group,
    logoutput => true,
  }
}
