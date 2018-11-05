file { '/usr/share/pam-configs/mkhomedir':
	ensure => 'file',
	mode => '644',
	source => 'puppet:///files/mkhomedir',
}
