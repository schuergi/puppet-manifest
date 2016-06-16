## TODO split class for different printer defaults
class semtix::client {

	package { 'semtixdb':
		ensure => installed,
		version => latest,
		}


##TODO add new printer's ppd file	
	#	file {'/usr/local/lib/printer.ppd'
	#		source => 'puppet://printer.ppd'
	#	}	
	
	}
