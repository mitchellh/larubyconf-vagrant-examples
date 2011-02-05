define apt::sources_list($ensure=present, $source=false, $content=false) {
  include apt

  if $source {
    # Source list from a source URL
    file { "/etc/apt/sources.list.d/${name}.list":
      ensure => $ensure,
      source => $source,
      before => Exec["apt-get update"],
      notify => Exec["apt-get update"]
    }
  }

  if $content {
    # Source list from a string
    file { "/etc/apt/sources.list.d/${name}.list":
      ensure  => $ensure,
      content => $content,
      before  => Exec["apt-get update"],
      notify  => Exec["apt-get update"]
    }
  }
}
