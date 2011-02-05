define python::pip_install {
  include python::pip

  exec { "pip-${name}":
    command => "sudo pip install -q '${name}'",
    unless  => "sudo pip freeze | grep -i '^${name}='",
    path    => "/usr/local/bin:/bin:/usr/bin",
    require => Exec["easy_install pip"]
  }
}
