class python::pip {
  include python
  include python::dev

  exec { "easy_install pip":
    unless  => "test -f /usr/local/bin/pip",
    path    => "/usr/bin",
    require => [Package["python"],
                Package["python-setuptools"],
                Package["python-dev"]]
  }
}
