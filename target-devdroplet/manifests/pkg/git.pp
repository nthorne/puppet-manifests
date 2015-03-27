class target-devdroplet::pkg::git {
  include common::pkg::git

  file { "${home}/.gitconfig":
    require =>  Package["git"],
    source  => "puppet:///modules/target-devdroplet/.gitconfig",
  }
}
