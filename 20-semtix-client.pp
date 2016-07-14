## TODO split class for different printer defaults
class semtix::client {

	package { 'semtixdb':
		ensure => 'latest',
		}


	file { '/etc/semtixdb/':
		ensure => 'directory',
		source => 'puppet:///files/semtixdb/conf',
		recurse => true,
		}

	file { '/usr/share/semtixdb/templates':
		ensure => 'directory',
		source => 'puppet:///files/semtixdb/templates',
		recurse => true,
		}

	file { '/etc/polkit-1/localauthority/10-vendor.d/org.opensuse.cupspkhelper.pkla':
		ensure => 'file',
		source => 'puppet:///files/org.opensuse.cupspkhelper.pkla',
		}

	
	file { '/etc/krb5.keytab':
		ensure => 'file',
		source => 'puppet:///files/krb5.keytab',
		mode => '600',
		}
	
	file { '/etc/cups/cupsd.conf':
		ensure => 'file',
		source => 'puppet:///files/cupsd.conf',
		}

	include semtix::client::software
	include semtix::client::mounts
}

