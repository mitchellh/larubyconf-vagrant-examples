class sqlite::dev {
  package { "sqlite-dev":
    name   => "libsqlite3-dev",
    ensure => latest
  }
}
