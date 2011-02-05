class trac {
  include apt
  include sqlite
  include sqlite::dev
  include python
  include python::pip

  python::pip_install { "trac": }

  exec { "setup-trac":
    command => 'echo "\n\n" | sudo trac-admin /vagrant/project initenv',
    unless  => "test -d /vagrant/project",
    path    => "/bin:/usr/bin:/usr/local/bin",
    require => [Python::Pip_install["trac"],
                Package["sqlite"],
                Package["sqlite-dev"]]
  }

  upstart::job { "trac":
    source  => "puppet:///modules/trac/upstart.conf",
    require => Exec["setup-trac"]
  }
}
