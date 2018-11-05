class semtix::client::firefox {

# here comes new config for Firefox 62+

file { '/usr/lib/firefox/distribution/distribution.ini':
	ensure => 'absent',
	}

file { '/etc/firefox/syspref.js':
	ensure => 'file',
	mode => '644',
	source => 'puppet:///files/firefox/syspref.js',
	}

file { '/usr/lib/firefox/defaults/pref/autoconfig.js':
	ensure => 'file',
	source => 'puppet:///files/firefox/autoconfig.js',
	mode => '644',
	}

file { '/usr/lib/firefox/firefox.cfg':
	ensure => 'file',
	source => 'puppet:///files/firefox/firefox.cfg',
	mode => '644',
	}

file { '/usr/lib/firefox/distribution/policies.json':
	ensure => 'file',
	mode => '644',
	source => 'puppet:///files/firefox/policies.json',
	}


}
