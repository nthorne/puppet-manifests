class target-slaptopen::pkg::vim {
  include target-slaptopen::pkg::git
  include common::pkg::vim
  include common::pkg::exuberant-ctags
  include target-slaptopen::src::repos

  file {"${home}/.vimrc":
    require => Exec["clone-vim-environment"],
    ensure => link,
    force => true,
    target => "${home}/.vim/.vimrc",
    owner => $user,
    group => $group,
  }

  exec {"clone-vim-environment":
    require => [Package["git"], File["${home}/repos"], Package["vim"], Package["exuberant-ctags"]],
    cwd => "${home}",
    creates => "${home}/.vim",
    command => "git clone --recursive http://github.com/nthorne/nthorne-vim-environment.git .vim",
    path => ["/bin", "/usr/bin", "/usr/sbin"],
    user => $user,
    group => $group,
    logoutput => true,
  }
}
