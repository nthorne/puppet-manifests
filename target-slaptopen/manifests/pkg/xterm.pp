class target-slaptopen::pkg::xterm {
  package {"xterm":
    before => Package["xfonts-terminus"],
    ensure => installed,
  }

  package {"xfonts-terminus":
    before => File["${home}/.Xresources"],
    ensure => installed,
  }

  file {"${home}/.Xresources":
    content => "XTerm*font: -xos4-terminus-medium-r-*-*-14-*-*-*-*-*-*-*
  XTerm*loginShell: true",
    mode => 0755,
    owner => $user,
    group => $group,
  }
}
