class semtix::client::software::cockpit {

	package { 'cockpit':
		ensure => latest,
		}

	package { 'cockpit-networkmanager':
		ensure => latest,
		}

	package { 'cockpit-packagekit':
		ensure => latest,
		}

	package { 'cockpit-storaged':
		ensure => latest,
		}



}
