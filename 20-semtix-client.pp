## TODO split class for different printer defaults
class semtix::client {

#	package { 'semtixdb':
#		ensure => 'latest',
#		}

	package { 'oracle-java8-installer':
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
		mode => '777',
		}

#	file { '/etc/polkit-1/localauthority/10-vendor.d/org.opensuse.cupspkhelper.pkla':
#		ensure => 'file',
#		source => 'puppet:///files/org.opensuse.cupspkhelper.pkla',
#		}

	
	file { '/etc/krb5.keytab':
		ensure => 'file',
		source => 'puppet:///files/krb5.keytab',
		mode => '600',
		}
	
#	file { '/etc/cups/cupsd.conf':
#		ensure => 'file',
#		source => 'puppet:///files/cupsd.conf',
#		}

	file { '/etc/login.defs':
		ensure => 'file',
		source => 'puppet:///files/login.defs',
		mode => '644',
		}

	file { '/etc/sddm.conf':
		ensure => 'file',
		source => 'puppet:///files/sddm.conf',
		mode => '644',
		owner => 'root',
		group => 'root',
		}


#	file { '/usr/share/applications/cups-web.desktop':
#		ensure => 'file',
#		source => 'puppet:///files/cups-web.desktop',
#		mode => '644',
#		}

	file { '/etc/systemd/system/sddm.service.d/override.conf':
		ensure => 'absent',
		source => 'puppet:///files/override.conf',
		mode => '644',
		}

	file { '/usr/local/share/ca-certificates/extra':
		ensure => 'directory',
		}

	file { '/usr/local/share/ca-certificates/extra/ca-chain.crt':
		ensure => 'file',
		source => 'puppet:///files/ca-chain.crt',
		mode => '444',
		}

	exec { 'update-ca-certificates':
		command => '/usr/sbin/update-ca-certificates',
		subscribe => [
			File['/usr/local/share/ca-certificates/extra/ca-chain.crt'],
		],
		refreshonly => true,
		}

	 file { '/etc/systemd/system/home-users.mount.d':
		ensure => 'directory',
		mode => '755',
		}

	file { '/etc/systemd/system/home-users.mount.d/override.conf':
		ensure => 'file',
		mode => '644',
		source => 'puppet:///files/override.conf',
		}

	include semtix::client::software
	include semtix::client::ssh
#	include semtix::client::mounts
	include semtix::client::firefox
	include semtix::client::cloud
	include semtix::client::wakeonlan
}

