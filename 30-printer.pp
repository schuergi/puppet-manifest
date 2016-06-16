class printer::judith {


# include 'cups::'
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
		uri 	=> 'socket://192.168.1.190:9100',
		options => {
			'accepting'	=> 'true',
			'enabled'	=> 'true',
			'PageSize'	=> 'A4',
			'Duplex'	=> 'true',
			'Resolution'	=> '600dpi',
			}
		
		}
		
	
}

class printer::kyocera {
# include 'cups::'
	class { '::cups':
	  default_queue => 'Kyocera-Kyocera-FS-4200DN',
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
		uri 	=> 'socket://192.168.1.190:9100',
		options => {
			'accepting'	=> 'true',
			'enabled'	=> 'true',
			'PageSize'	=> 'A4',
			'Duplex'	=> 'true',
			'Resolution'	=> '600dpi',
			}
		
		}
		
	

}
