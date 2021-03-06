class target-slaptopen::pkg::nix {
  include common::pkg::curl

  file {"/nix":
    ensure => "directory",
    mode => 0755,
    owner => $user,
    group => $user,
  }

  exec {"nix":
    require => [Package["curl"], File["/nix"]],
    cwd => "/tmp",
    command => "curl https://nixos.org/nix/install | sh",
    creates => "/nix/store",
    path => ["/bin", "/sbin", "/usr/bin", "/usr/sbin"],
    logoutput => true,
  }
}
