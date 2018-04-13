class semtix::distcc {

	file {'/etc/default/distcc':
		ensure => 'present',
		source => 'puppet:///files/distcc',
	}
	
	service { 'distcc':
		provider => 'systemd',
		ensure => 'running',
		enable => 'true',
	}

}
