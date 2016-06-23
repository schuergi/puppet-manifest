class printer::judith {


	class { '::cups':
	  default_queue => 'KONICA_MINOLTA_362_282_222',
		}
	
	cups_queue { 'KONICA_MINOLTA_362_282_222':
		ensure 	=> 'printer',
		uri 	=> 'socket://192.168.1.130',
		options => {
			'accepting'	=> 'true',
			'enabled'	=> 'true',
			'PageSize'	=> 'A4',
			'Duplex'	=> 'true',
			'Resolution'	=> '600dpi',
			}
		}

	cups_queue { 'Kyocera-Kyocera-FS-4200DN':
		ensure 	=> 'printer',
		uri 	=> 'ipp://192.168.1.199/ipp',
		options => {
			'accepting'	=> 'true',
			'enabled'	=> 'true',
			'make_and_model' => 'raw',
			}
		
		}
		
	file { '/usr/share/ppd/custom/KO362U.ppd':
	        source => 'puppet:///files/KO362U.ppd',
	        owner => 'root',
	        group => 'root',
	        mode => '644',
	        ensure => 'file',
		}
	
}

class printer::kyocera {

	class { '::cups':
		default_queue => 'Kyocera-Kyocera-FS-4200DN',
		}
	
	cups_queue { 'KONICA_MINOLTA_362_282_222':
		ensure 	=> 'printer',
		uri 	=> 'socket://192.168.1.130',
		ppd	=> '/usr/share/ppd/custom/KO362U.ppd',
		options => {
			'accepting'	=> 'true',
			'enabled'	=> 'true',
			'PageSize'	=> 'A4',
			'Duplex'	=> 'true',
			'Resolution'	=> '600dpi',
			}
		}

	cups_queue { 'Kyocera-Kyocera-FS-4200DN':
                ensure  => 'printer',
                uri     => 'ipp://192.168.1.199/ipp',
                make_and_model => 'raw',
                options => {
                        'accepting'     => 'true',
                        'enabled'       => 'true',
                        }

                }


	file { '/usr/share/ppd/custom/KO362U.ppd':
	        source => 'puppet:///files/KO362U.ppd',
	        owner => 'root',
	        group => 'root',
	        mode => '644',
	        ensure => 'file',
	
		}

}

