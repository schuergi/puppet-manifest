class semtix::client {

	package { 'semtixdb':
		ensure => installed,
		version => latest,
		}

	include '::cups'
	
	cups_queue { 'KONICA_MINOLTA_362_282_222':
		ensure 	=> 'printer',
	#	ppd 	=> '',
		uri 	=> 'socket://192.168.1.130',
		options => {
			'accepting'	=> 'true',
			'enabled'	=> 'true',
			'PageSize'	=> 'A4',
			'Duplex'	=> 'true',
			'Resolution'	=> '600dpi',
			}
	}
	
}
