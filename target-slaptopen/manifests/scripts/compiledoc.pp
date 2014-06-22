class target-slaptopen::scripts::compiledoc {
  include target-slaptopen::pkg::plantuml
  include target-slaptopen::pkg::pandoc
  include target-slaptopen::src::bin

  exec {"install-compiledoc":
    require => [Exec["install-plantuml"], File["${home}/bin"], Package["pandoc"]],
    cwd => "${home}/bin",
    creates => "${home}/bin/compiledoc",
    user => $user,
    group => $group,
    logoutput => true,
    mode => 0744,
    source => "puppet:///modules/target-slaptopen/.gnupg",
  }
}
