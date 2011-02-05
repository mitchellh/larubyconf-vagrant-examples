class demo {
  include apt
  include apache2
  include apache2::php5

  apache2::site { "demo":
    source  => "puppet:///modules/demo/vhost.conf",
    require => Package["php5"]
  }
}
