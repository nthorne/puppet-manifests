class target-slaptopen::pkg::rust {
  include common::pkg::curl

  exec {"install-rust":
    require => Package["curl"],
    cwd => "${target}/files/generated/",
    command => "curl -sSf https://static.rust-lang.org/rustup.sh | sh",
    creates => "/usr/local/bin/rustc",
    path => ["/bin", "/sbin", "/usr/bin", "/usr/sbin"],
    logoutput => true,
  }
}
