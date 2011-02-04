class apt {
  exec { "apt-get update":
    command     => "/usr/bin/apt-get update"
  }

  # apt-get update must run before all packages or failures can occur
  Exec["apt-get update"] -> Package<||>

  # We want to manage the sources directory ourself
  file { "/etc/apt/sources.list.d":
    ensure  => directory,
    owner   => root,
    group   => root,
    mode    => 755,
    recurse => true,
    purge   => true,
    force   => true
  }

  case $lsbdistcodename {
    /lucid|squeeze/: {
      # We want to make sure that the preferences directory is
      # empty unless we add something to it ourselves.
      file { "/etc/apt/preferences":
        ensure => absent
      }

      file { "/etc/apt/preferences.d":
        ensure  => directory,
        owner   => root,
        group   => root,
        mode    => 755,
        recurse => true,
        purge   => true,
        force   => true
      }
    }
  }
}
