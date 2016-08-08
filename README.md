# galera_innoptimizer

#### Table of Contents

1. [Overview](#overview)
2. [Usage - Configuration options and additional functionality](#usage)
3. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Overview

This is a Puppet module to install [Galera Innoptimizer](https://github.com/deimosfr/galera_innoptimizer)
which is a tool to optimize InnoDB tables in a MariaDB/Galera cluster without
causing locking problems.

## Usage

The simplest use case is to accept all defaults:

```puppet
include ::galera_innoptimizer
```

There are some parameters that can be set:

```puppet
class { '::galera_innoptimizer':
  version    => undef,
  installdir => '/opt/galera_innoptimizer',
  bindir     => '/usr/local/bin',
}
```

### `version`

Version of galera_innoptimizer to check out from the git repo. Usually this would be a
[tagged release](https://github.com/deimosfr/galera_innoptimizer/releases) but it could
also be a git commit ID. Leave this blank to install git HEAD.

### `installdir`

Specify the directory where the git repo should be checked out. Default: `/opt/galera_innoptimizer`

### `bindir`

Specify the bin directory where the script itself should be symlinked. Default: `/usr/local/bin`


## Reference

## Limitations

The first release of `jgazeley/galera_innoptimizer` supports only Red Hat and
related EL distros. Support for Debian family is on the roadmap.

## Development

Pull requests welcome.

## Release Notes
