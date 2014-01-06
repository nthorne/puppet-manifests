class target-slaptopen::pkg::xmonad {
  include target-slaptopen::pkg::git
  include target-slaptopen::pkg::xterm
  include target-slaptopen::src::repos

  package {"xmonad":
    before => Exec["clone-xmonad-environment"],
    ensure => installed,
  }

  package {"xcompmgr":
    before => Exec["clone-xmonad-environment"],
    require => Package["xmonad"],
    ensure => installed,
  }

  package {"dzen2":
    require => Package["xmonad"],
    ensure => installed,
  }

  package {"suckless-tools":
    require => Package["xmonad"],
    ensure => installed,
  }

  package {"unclutter":
    require => Package["xmonad"],
    ensure => installed,
  }

  package {"libghc-xmonad-contrib-dev":
    require => Package["xmonad"],
    ensure => installed,
  }

  file {"${home}/.xmonad":
    require => Exec["clone-xmonad-environment"],
    ensure => directory,
    force => true,
    owner => $user,
    group => $group,
  }

  file {"${home}/.xmonad/xmonad.hs":
    require => File["${home}/.xmonad"],
    ensure => link,
    force => true,
    target => "${home}/repos/nthorne-xmonad-environment/xmonad-home.hs",
    owner => $user,
    group => $group,
  }

  exec {"clone-xmonad-environment":
    require => [Package["git"], File["${home}/repos"], Package["xmonad"]],
    cwd => "${home}/repos",
    creates => "${home}/repos/nthorne-xmonad-environment",
    command => "git clone --recursive http://github.com/nthorne/nthorne-xmonad-environment.git",
    path => ["/bin", "/usr/bin", "/usr/sbin"],
    user => $user,
    group => $group,
    logoutput => true,
  }

  file {"/usr/share/xsessions/xmonad.desktop":
    before => Notify["xmonad.desktop"],
    require => Package["xmonad"],
    content => "[Desktop Entry]
  Encoding=UTF-8
  Name=XMonad
  Comment=Lightweight tiling window manager
  Exec=/usr/sbin/xmonad-xcompmgr
  Icon=xmonad.png
  Type=XSession",
    mode => 0644,
    owner => root,
    group => root,
  }

  notify {"xmonad.desktop":}

  file {"/usr/sbin/xmonad-xcompmgr":
    subscribe => Notify["xmonad.desktop"],
    require => [Package["xcompmgr"], Package["dzen2"], Package["unclutter"]],
    content => "#!/bin/bash
  unclutter&
  xcompmgr&
  xmonad | dzen2 -ta l",
    mode => 0755,
    owner => root,
    group => root,
  }
}
