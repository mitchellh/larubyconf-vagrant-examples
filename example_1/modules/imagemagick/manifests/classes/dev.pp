class imagemagick::dev {
  package { ["libmagickcore-dev", "libmagickwand-dev"]:
    ensure => installed
  }
}
