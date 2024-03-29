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

#	file { '/etc/apt/sources.list.d/semtix.list':
#		source => 'puppet:///files/semtix.list',
#		ensure => file,
#		mode => '0644',
#		}

        file {'/etc/apt/apt.conf.d/02proxy':
               source => 'puppet:///files/02proxy',
               ensure => absent,
               mode => '0644',
               }

	cron { unattended-upgrades:
		command => '/usr/bin/unattended-upgrade',
		user => root,
		minute => 0,
		}

	class { 'apt': }

	apt::ppa { 'ppa:atareao/telegram': }


#	apt::key { 'puppetlabs':
#		id => '6F6B15509CF8E59E6E469F327F438280EF8D349F',
#		server => 'pgp.mit.edu',
#	}

#	apt::source { 'puppetlabs':
#		location => 'http://apt.puppetlabs.com',
#		repos => 'puppet6',
#		key => {
#			'id' => '4528B6CD9E61EF26',
#			'server' => 'pgp.mit.edu',
#		}
#	}
#	package {'puppet':
#		ensure => absent,
#	}

#	package {'puppet-agent':
#		ensure => latest,
#	}


	apt::source { 'adoptopenjdk':
		location => 'https://adoptopenjdk.jfrog.io/adoptopenjdk/deb',
		repos => 'main',
		key => {
			'id' => '8ED17AF5D7E675EB3EE3BCE98AC3B29174885C03',
			'server' => 'pgp.mit.edu',
			}
		}

	package {'adoptopenjdk-8-hotspot-jre':
		ensure => latest,
	}

#	package { 'xfce4-goodies':
#		ensure => latest,
#		}
	
#	package { 'pdfchain':
#		ensure => latest,
#		}

	package { 'cifs-utils':
		ensure => latest,
		}
#	package { 'gvfs-backends':
#		ensure => latest,
#		}

#	package { 'docky':
#		ensure => latest,
#		}
	package { 'screen':
		ensure => latest,
		}

	package { 'ethtool':
		ensure => latest,
		}

#	package { 'gconf-editor':
#		ensure => latest,
#		}

	package { 'enigmail':
		ensure => absent,
		}
	package { 'dosbox':
		ensure => latest,
		}
#	package { 'alacarte':
#		ensure => latest,
#		}
	package { 'alsa-utils':
		ensure => latest,
		}

	package { 'lm-sensors':
		ensure => latest,
		}

	package { 'cpufrequtils':
		ensure => latest,
		}
	package {'unoconv':
		ensure=> latest,
	}
	package { 'tmux':
		ensure => latest,
		}
	package {'ubuntustudio-fonts':
		ensure => latest,
		}
	package {'tigervnc-viewer':
		ensure => latest,
		}
	package {'scribus':
		ensure => latest,
		}
	package {'build-essential':
		ensure => latest,
		}
	package {'distcc-pump':
		ensure => latest,
		}
	package {'devscripts':
		ensure => latest,
		}
	package {'pbuilder':
		ensure => latest,
		}
	package {'quilt':
		ensure => latest,
		}
	package {'qtcreator':
		ensure => latest,
		}
	package {'git':
		ensure => latest,
		}
	package {'git-man':
		ensure => latest,
		}
	package {'gimp':
		ensure => latest,
		}
	package {'gimp-data-extras':
		ensure => latest,
		}
	package {'gimp-help-de':
		ensure => latest,
		}
	package {'keychain':
		ensure => latest,
		}
	package {'kwalletcli':
		ensure => latest,
		}
	package {'inkscape':
		ensure => latest,
		}
	package {'ink-generator':
		ensure => latest,
		}
	package {'usb-creator-kde':
		ensure => latest,
		}
	package {'zsync':
		ensure => latest,
		}
	package {'atril':
		ensure => latest,
		}
	package {'zoom':
		ensure => latest,
		}
	package {'k3b':
		ensure => latest,
		}
	package {'kamoso':
		ensure => latest,
		}
	package {'glances':
		ensure => latest,
		}
	package {'telegram':
		ensure => latest,
		}
	file {'/usr/lib/libreoffice/share/extensions/LanguageTool':
		recurse => remote,
		source => 'puppet:///files/LanguageTool',
		}
	package {'python3-venv':
		ensure => latest,
		}

include semtix::client::software::cockpit

}

class semtix::firmware {

	package { 'firmware-linux-nonfree':
		ensure => latest,
		}

#	apt::source { 'debian_non-free':
#		comment => 'Debian nonfree repo',
#		location => 'http://ftp.de.debian.org/debian/',
#		release => 'jessie',
#		repos => 'main non-free',
#		}
}
