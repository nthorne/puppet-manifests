class target-slaptopen::pkg::direnv {
  include target-slaptopen::pkg::nix

  file {"${home}/.direnvrc":
    require => Exec["direnv"],
    content => "use_nix() {
  source $HOME/.nix-profile/etc/profile.d/nix.sh
  export NIX_PATH=/nix/var/nix/profiles/per-user/$USER/channels
  export NIX_PROFILE=$PWD/.direnv/nix
  load_prefix $PWD/.direnv/nix
}
    ",
    mode => 0644,
    owner => $user,
    group => $user,
  }

  exec {"direnv":
    require => Exec["nix"],
    cwd => "/tmp",
    command => "nix-env --install direnv",
    creates => "/nix/store",
    path => ["/bin", "/sbin", "/usr/bin", "/usr/sbin"],
    logoutput => true,
  }
}
