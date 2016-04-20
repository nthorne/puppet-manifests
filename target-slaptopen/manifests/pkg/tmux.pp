class target-slaptopen::pkg::tmux {
  include target-slaptopen::pkg::git
  include common::pkg::xsel
  include target-slaptopen::src::repos

  file {"${home}/.tmux/plugins":
    ensure => "directory",
    mode => 0644,
    owner => $user,
    group => $group,
  }

  file {"${home}/.tmux.conf":
    require => [Exec["clone-tmux-environment"], Exec["clone-tmux-tpm"]],
    ensure => link,
    force => true,
    target => "${home}/repos/nthorne-tmux-environment/.tmux.conf",
    owner => $user,
    group => $group,
  }
  exec {"tmux-dev":
    creates => "/usr/bin/tmux",
    command => "apt-get install -y python-software-properties software-properties-common && add-apt-repository -y ppa:pi-rho/dev && apt-get update && apt-get install -y tmux=2.0-1~ppa1~t",
    path => ["/bin", "/usr/bin", "/usr/sbin"],
    user => $user,
    group => $group,
    logoutput => true,
  }

  exec {"clone-tmux-environment":
    require => [Package["xsel"], Package["git"], File["${home}/repos"], Exec["tmux-dev"]],
    cwd => "${home}/repos",
    creates => "${home}/repos/nthorne-tmux-environment",
    command => "git clone --recursive http://github.com/nthorne/nthorne-tmux-environment.git",
    path => ["/bin", "/usr/bin", "/usr/sbin"],
    user => $user,
    group => $group,
    logoutput => true,
  }

  exec {"clone-tmux-tpm":
    require => [Package["git"], File["${home}/repos"], Exec["clone-tmux-environment"], File["${home}/.tmux/plugins"]],
    cwd => "${home}/.tmux/plugins",
    creates => "${home}/.tmux/plugins/tpm",
    command => "git clone --recursive git clone https://github.com/tmux-plugins/tpm",
    path => ["/bin", "/usr/bin", "/usr/sbin"],
    user => $user,
    group => $group,
    logoutput => true,
  }
}
