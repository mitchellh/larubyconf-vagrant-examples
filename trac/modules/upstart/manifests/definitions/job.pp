define upstart::job($source=undef, $content=undef, $service=true, $ensure=running) {
  $conf_file = "/etc/init/${name}.conf"

  file { $conf_file:
    owner  => root,
    group  => root,
    mode   => 644,
    ensure => present
  }

  if $source {
    File[$conf_file] { source => $source }
  } elsif $content {
    File[$conf_file] { content => $content }
  } else {
    fail "upstart::job requires source or content"
  }

  if $service {
    service { $name:
      ensure   => $ensure,
      provider => upstart,
      require  => File["/etc/init/${name}.conf"]
    }

    # Restart the service whenever the configuration changes
    File[$conf_file] { notify => Service[$name] }
  }
}
