class printer::virtual {

#	package { 'boomaga':
#		ensure => 'installed', 
#		}

	package { 'printer-driver-cups-pdf':
		ensure => 'installed',
		 }

#	cups_queue { 'cups-pdf':
#	                ensure  => 'printer',
#        	        uri     => 'cups-pdf:/',
#                        accepting     => 'true',
#                        enabled       => 'true',
#
#                }

#        cups_queue { 'boomaga':
        #        ensure  => 'printer',
#                uri     => 'boomaga:/',
#                accepting     => 'true',
#                enabled       => 'true',
#                }

}
