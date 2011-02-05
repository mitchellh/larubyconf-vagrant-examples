class python {
  package { ["python", "python-setuptools"]:
    ensure => present
  }
}
