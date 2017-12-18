## TODO split class for different printer defaults
class semtix::client {

#	package { 'semtixdb':
#		ensure => 'latest',
#		}


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

	file { '/etc/systemd/network/wol.link':
		ensure => 'file',
		source => 'puppet:///files/wol.link',
		mode => '644',
		owner => 'root',
		group => 'root',
		}


#	file { '/usr/share/applications/cups-web.desktop':
#		ensure => 'file',
#		source => 'puppet:///files/cups-web.desktop',
#		mode => '644',
#		}

	include semtix::client::software
#	include semtix::client::mounts
}

