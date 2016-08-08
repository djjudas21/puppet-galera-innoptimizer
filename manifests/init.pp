# galera_innoptimizer - see README for full details
class galera_innoptimizer (
  $version = undef,
  $installdir = '/opt/galera_innoptimizer',
  $bindir = '/usr/local/bin',
) {
  include ::python
  include ::galera_innoptimizer::params

  # Validate paths
  validate_absolute_path($installdir)
  validate_absolute_path($bindir)

  # Create dir to cloned repo
  file { $installdir:
    ensure => directory,
  }

  # vcsrepo check out app
  vcsrepo { $installdir:
    ensure   => present,
    provider => git,
    source   => 'https://github.com/deimosfr/galera_innoptimizer.git',
    revision => $version,
    require  => [
      File[$installdir],
      Class['::galera_innoptimizer::params'],
    ],
  }

  # Symlink to bindir in path
  file { "${bindir}/ginnoptimizer":
    ensure  => link,
    target  => "${installdir}/ginnoptimizer.py",
    require => Vcsrepo[$installdir],
  }
}
