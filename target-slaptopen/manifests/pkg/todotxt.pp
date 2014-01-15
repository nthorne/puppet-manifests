class target-slaptopen::pkg::todotxt {
  include target-slaptopen::pkg::git
  include target-slaptopen::src::repos

  exec {"clone-todotxt":
    require => [Package["git"], File["${home}/repos"]],
    cwd => "${home}/repos",
    creates => "${home}/repos/todo.txt-cli",
    command => "git clone --recursive http://github.com/ginatrapani/todo.txt-cli.git todo.txt-cli",
    path => ["/bin", "/usr/bin", "/usr/sbin"],
    user => $user,
    group => $group,
    logoutput => true,
  }

  exec {"clone-todotxt-environment":
    require => [Exec["clone-todotxt"]],
    cwd => "${home}",
    creates => "${home}/.todo",
    command => "git clone --recursive http://github.com/nthorne/nthorne-todo.txt-environment.git .todo",
    path => ["/bin", "/usr/bin", "/usr/sbin"],
    user => $user,
    group => $group,
    logoutput => true,
  }
}
