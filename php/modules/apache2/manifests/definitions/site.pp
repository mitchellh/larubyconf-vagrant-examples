define apache2::site($source) {
  include apache2

  file { "/etc/apache2/sites-available/${name}":
    source  => $source,
    owner   => root,
    group   => root,
    mode    => 644,
    require => Package["apache2"]
  }

  exec { "sudo a2ensite ${name}":
    path    => "/usr/bin:/usr/sbin",
    require => File["/etc/apache2/sites-available/${name}"],
    notify  => Service["apache2"]
  }
}
