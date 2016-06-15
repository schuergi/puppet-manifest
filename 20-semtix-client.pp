## TODO split class for different printer defaults
class semtix::client {

	package { 'semtixdb':
		ensure => installed,
		version => latest,
		}

	include '::cups'
##TODO add new printer's ppd file	
#	file {'/usr/local/lib/printer.ppd'
#		source => 'puppet://printer.ppd'
#	}	
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
