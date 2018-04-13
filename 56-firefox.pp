class semtix::client::firefox {

file { '/usr/lib/firefox/cck2/':
	ensure => 'directory',
	source => 'puppet:///files/firefox/cck2',
	mode => '755',
	owner => 'root',
	group => 'root',
}

file { '/usr/lib/firefox/cck2.cfg':
	ensure => 'file',
	source => 'puppet:///files/firefox/cck2.cfg',
	owner => 'root',
	group => 'root',
}

file { '/usr/lib/firefox/defaults/':
	ensure => 'directory',
	source => 'puppet:///files/firefox/defaults/',
	replace => 'false',
	mode => '755',
	owner => 'root',
	group => 'root',
}
}
