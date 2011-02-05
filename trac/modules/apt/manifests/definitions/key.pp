define apt::key($ensure=present, $source, $check_name=undef) {
  include apt

  # Since we can't reassign $check_name, have to do this.
  $real_check_name = $check_name ? {
    undef   => $name,
    default => $check_name
  }

  case $ensure {
    present: {
      exec { "import gpg key ${name}":
        command => "wget -O - '${source}' | apt-key add -",
        unless  => "apt-key list | grep -Fqe '${real_check_name}'",
        path    => "/bin:/usr/bin",
        before  => Exec["apt-get update"],
        notify  => Exec["apt-get update"]
      }
    }

    absent: {
      # TODO: This probably doesn't work right...
      exec { "apt-key del ${name}":
        path    => "/bin:/usr/bin",
        onlyif => "apt-key list | grep -Fqe '${real_check_name}'"
      }
    }
  }
}
