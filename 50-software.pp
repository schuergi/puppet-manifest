class semtix::client::software {

#	apt::key { 'semtix':
	#	id => '935EBF8409C36C93DE71F2873D8C0990A149AB19',
#		id => '47B320EB4C7C375AA9DAE1A01054B7A24BD6EC30',
#		server => 'pool.sks-keyservers.net',
#		}

#        class { 'apt':
#                update => {
#                frequency => 'daily',
#                       },
#                }


	class { 'unattended_upgrades':
		enable => 1,
	#	enable_on_shutdown => true,
		age => {
		max => 2,
			},
		}

	cron { unattended-upgrades:
		command => '/usr/bin/unattended-upgrade',
		user => root,
		minute => 0,
		}

	package { 'xfce4-goodies':
		ensure => latest,
		}
	
	package { 'pdfchain':
		ensure => latest,
		}

	package { 'cifs-utils':
		ensure => latest,
		}
	package { 'gvfs-backends':
		ensure => latest,
		}

	package { 'docky':
		ensure => latest,
		}
	package { 'screen':
		ensure => latest,
		}

	package { 'ethtool':
		ensure => latest,
		}

	package { 'gconf-editor':
		ensure => latest,
		}

	package { 'enigmail':
		ensure => latest,
		}
	package { 'dosbox':
		ensure => latest,
		}
	package { 'alacarte':
		ensure => latest,
		}
	package { 'alsa-utils':
		ensure => latest,
		}
	package { 'lm-sensors':
		ensure => latest,
		}
}

class semtix::firmware {

	package { 'firmware-linux-nonfree':
		ensure => latest,
		}

	apt::source { 'debian_non-free':
		comment => 'Debian nonfree repo',
		location => 'http://ftp.de.debian.org/debian/',
		release => 'jessie',
		repos => 'main non-free',
		}
}
