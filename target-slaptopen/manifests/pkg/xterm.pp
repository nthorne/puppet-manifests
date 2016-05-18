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
    require =>  Package["xterm"],
    source  => "puppet:///modules/target-slaptopen/.Xresources",
  }
}
