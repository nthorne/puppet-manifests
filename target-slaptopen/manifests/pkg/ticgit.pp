class target-slaptopen::pkg::ticgit {
  exec {"install-ticgit":
    #require => [Package["ruby-dev"], Package["libicu-dev"], Package["g++"]],
    creates => "/usr/local/bin/ti",
    command => "gem install TicGit-ng",
    path => ["/bin", "/sbin", "/usr/bin", "/usr/sbin"],
    user => "root",
    group => "root",
    logoutput => true,
  }
}
