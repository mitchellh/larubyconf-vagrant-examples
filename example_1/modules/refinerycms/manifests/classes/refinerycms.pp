class refinerycms {
  include apt
  include gem::fast_mode
  include sqlite
  include sqlite::dev
  include imagemagick
  include imagemagick::dev

  package { ["libxml2", "libxml2-dev", "libxslt1-dev"]:
    ensure => latest
  }

  package { "refinerycms":
    provider => gem
  }

  exec { "sudo refinerycms .":
    cwd     => "/vagrant",
    user    => "root",
    unless  => "test -f /vagrant/Gemfile",
    path    => "/usr/bin",
    require => [Package["refinerycms"],
                Package["libxml2"],
                Package["libxml2-dev"],
                Package["libxslt1-dev"],
                Package["sqlite"],
                Package["sqlite-dev"],
                Package["imagemagick"],
                Package["libmagickcore-dev"],
                Package["libmagickwand-dev"]]
  }
}
