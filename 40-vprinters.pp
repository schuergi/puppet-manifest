class printer::virtual {

	package { 'boomaga':
		ensure => 'installed', 
		}

	package { 'printer-driver-cups-pdf':
		ensure => 'installed',
		 }

	cups_queue { 'cups-pdf':
	                ensure  => 'printer',
        	        uri     => 'cups-pdf:/',
                	options => {
                        	'accepting'     => 'true',
                        	'enabled'       => 'true',
                        	'PageSize'      => 'A4',
                        	}
                }

        cups_queue { 'boomaga':
                ensure  => 'printer',
                uri     => 'boomaga:/',
                options => {
                        'accepting'     => 'true',
                        'enabled'       => 'true',
                        'PageSize'      => 'A4',
                        'Duplex'        => 'true',
                        'Resolution'    => '600dpi',
                        }

                }

}
