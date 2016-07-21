class semtix::client::software {
	
	package { 'pdfchain':
		ensure => latest,
		}

	package { 'cifs-utils':
		ensure => latest,
		}
	package { 'gvfs-backends':
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
