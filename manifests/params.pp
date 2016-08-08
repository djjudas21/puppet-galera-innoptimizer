# OS-specific packages to be installed
class galera_innoptimizer::params {

  case $::osfamily {
    'RedHat': {
      case $::operatingsystem {
        # Fedora only
        'Fedora': {
          package { 'MySQL-python':
            ensure  => installed,
            require => Class['python'],
          }
        }
        # All other Red Hat except Fedora
        default: {
          include ::epel

          package { [
            'python-colorama',
            'MySQL-python',
          ]:
            ensure  => installed,
            require => Class[
              'python',
              'epel'
            ],
          }
        }
      }
    }
    # Debian-based distros
    'Debian': {
      package { [
        'python-colorama',
        'python-mysqldb',
      ]:
        ensure  => installed,
        require => Class['python'],
      }
    }
    default: {
      fail("Operating system ${::operatingsystem} not supported by this module")
    }
  }
}
