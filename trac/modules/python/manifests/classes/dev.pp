class python::dev {
  include python

  package { "python-dev":
    ensure => present
  }
}
