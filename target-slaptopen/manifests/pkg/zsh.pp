class target-slaptopen::pkg::zsh {
  include target-slaptopen::pkg::git
  include common::pkg::zsh
  include target-slaptopen::src::repos

  file {"${home}/.zshrc":
    require => Exec["clone-zsh-environment"],
    ensure => link,
    force => true,
    target => "${home}/.zsh/.zshrc",
    owner => $user,
    group => $group,
  }

  file {"${home}/.zprofile":
    require => Exec["clone-zsh-environment"],
    ensure => link,
    force => true,
    target => "${home}/.zsh/.zprofile",
    owner => $user,
    group => $group,
  }

  file {"${home}/.zshenv":
    require => Exec["clone-zsh-environment"],
    ensure => link,
    force => true,
    target => "${home}/.zsh/.zshenv",
    owner => $user,
    group => $group,
  }

  exec {"clone-zsh-environment":
    require => [Package["git"], Package["zsh"]],
    cwd => "${home}",
    creates => "${home}/.zsh",
    command => "git clone --recursive http://github.com/nthorne/nthorne-zsh-environment.git .zsh",
    path => ["/bin", "/usr/bin", "/usr/sbin"],
    user => $user,
    group => $group,
    logoutput => true,
  }
}
