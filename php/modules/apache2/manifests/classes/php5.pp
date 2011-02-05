class apache2::php5 {
  include apache2

  package { "php5":
    ensure  => installed,
    require => [Package["apache2"]],
    notify  => Service["apache2"]
  }
}
