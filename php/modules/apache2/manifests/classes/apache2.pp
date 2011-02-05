class apache2 {
  package { "apache2":
    ensure => latest
  }

  service { "apache2":
    ensure     => running,
    enable     => true,
    hasrestart => true,
    require    => Package["apache2"]
  }

  exec { "a2dissite default":
    path   => "/usr/sbin:/usr/bin",
    onlyif => "test -L /etc/apache2/sites-enabled/000-default",
    notify => Service["apache2"]
  }
}
