# Class: galera_innoptimizer
# ===========================
#
# Full description of class galera_innoptimizer here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'galera_innoptimizer':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class galera_innoptimizer {
  include ::python
  include ::epel

  # Install Python dependencies
  package { [
    'python2-configargparse',
    'python-colorama',
    'MySQL-python',
  ]:
    ensure  => installed,
    require => Class['python', 'epel'],
  }

  # Create dir to cloned repo
  file { '/opt/galera_innoptimizer':
    ensure => directory,
  }

  # vcsrepo check out app
  vcsrepo { '/opt/galera_innoptimizer':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/deimosfr/galera_innoptimizer.git',
    revision => '0.3.0',
    require  => File['/opt/galera_innoptimizer'],
  }

  # Symlink to bindir in path
  file { '/usr/local/bin/ginnoptimizer':
    ensure  => link,
    target  => '/opt/galera_innoptimizer/ginnoptimizer.py',
    require => Vcsrepo['/opt/galera_innoptimizer'],
  }


}
