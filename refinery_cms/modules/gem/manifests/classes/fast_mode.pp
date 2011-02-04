class gem::fast_mode {
  file { "/etc/gemrc":
    owner   => root,
    group   => root,
    mode    => 644,
    content => "gem: --no-ri --no-rdoc"
  }

  # Must run before any package tasks with the gem provider
  File["/etc/gemrc"] -> Package<| provider == gem |>
}
