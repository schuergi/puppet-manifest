## TODO split class for different printer defaults
class semtix::client {

#	package { 'semtixdb':
#		ensure => 'latest',
#		}

#	package { 'oracle-java8-installer':
#		ensure => 'latest',
#		}

	package { 'openjdk-8-jre':
		ensure => 'latest',
		}

#	alternatives { 'java':
#		path => '/usr/lib/jvm/java-1.8.0-openjdk-amd64/',
#		}

	file { '/etc/semtixdb/':
		ensure => 'directory',
		source => 'puppet:///files/semtixdb/conf',
		recurse => true,
		}

	file { '/var/log/semtixdb':
		ensure => 'directory',
		mode => '777',
		}

#	file {'/etc/logrotate.d/semtixdb':
#		ensure => 'file',
#		source => 'puppet:///files/semtixdb-logrotate',
#		}

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

	file {'/etc/modprobe.d/nfsd.conf':
		ensure => 'file',
		mode => '644',
		source => 'puppet:///files/nfsd.conf',
		}
	file { '/etc/default/nfs-common':
		ensure => 'file',
		mode => '644',
		source => 'puppet:///files/nfs-common',
		}

	file { '/etc/modprobe.d/blacklist-uas.conf':
		ensure => 'file',
		mode => '644',
		source => 'puppet:///files/blacklist-uas.conf',
		}

	file { '/usr/lib/thunderbird/isp/refrat.hu-berlin.de.xml':
		ensure => 'file',
		mode => '644',
		source => 'puppet:///files/refrat.hu-berlin.de.xml',
		}

	file { '/etc/systemd/system/puppet.service.d':
		ensure => 'directory',
		mode => '755',
		}
	file { '/etc/systemd/system/puppet.service.d/override.conf':
		ensure => 'file',
		mode => '644',
		source => 'puppet:///files/puppet.service.d/override.conf',
		}

#	class {'::puppet_agent':
#		package_version => '6.24.0',
#		service_names   => ['puppet'],
#		collection      => 'puppet6',
#	}


	service {'puppet':
		ensure => 'running',
		enable => 'true',
		provider => 'systemd',
		}

	include semtix::client::software
	include semtix::client::ssh
#	include semtix::client::mounts
	include semtix::client::firefox
	include semtix::client::cloud
	include semtix::client::wakeonlan
}

