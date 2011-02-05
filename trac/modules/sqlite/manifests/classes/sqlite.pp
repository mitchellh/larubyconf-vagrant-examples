class sqlite {
  package { "sqlite":
    name   => "sqlite3",
    ensure => latest
  }
}
