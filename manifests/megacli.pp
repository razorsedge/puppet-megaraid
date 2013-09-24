# == Class: megaraid::megacli
#
# installs the package(s) that provide the `MegaCLI` utility
#
# === Parameters
#
# Accepts no parameters.
#
# === Examples
#
#   class { 'megaraid::megacli': }
#
# === Authors
#
# Joshua Hoblitt <jhoblitt@cpan.org>
#
# === Copyright
#
# Copyright (C) 2012-2013 Joshua Hoblitt
#
class megaraid::megacli inherits megaraid::params {
  case $::architecture {
    'x86_64' : { $megacli_path = '/opt/MegaRAID/MegaCli/MegaCli64' }
    'i386'   : { $megacli_path = '/opt/MegaRAID/MegaCli/MegaCli' }
  }

  package { 'MegaCli':
    ensure => present,
  }

  file { '/usr/bin/MegaCli':
    ensure => link,
    target => $megacli_path,
  }
#  exec { "alternatives --install /usr/bin/MegaCli MegaCli ${megacli_path} 1":
#    path   => '/bin:/sbin:/usr/bin:/usr/sbin',
#    unless => "test /etc/alternatives/MegaCli -ef ${megacli_path}"
#  } ->
#  exec { "alternatives --set MegaCli ${megacli_path}":
#    path   => '/bin:/sbin:/usr/bin:/usr/sbin',
#    unless => "test /etc/alternatives/MegaCli -ef ${megacli_path}"
#  }
}
