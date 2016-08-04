class semtix::client::software {

	apt::key { 'semtix':
		id => '935EBF8409C36C93DE71F2873D8C0990A149AB19',
		server => 'pool.sks-keyservers.net',
		}

        class { 'apt':
                update => {
                frequency => 'daily',
                        },
                }


	class { 'unattended_upgrades':
		enable => 1,
		age => {
		max => 2,
			},
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
