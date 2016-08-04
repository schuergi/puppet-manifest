class printer::judith {

	file { '/usr/share/ppd/custom/KO367GX.ppd':
	        source => 'puppet:///files/KO367GX.ppd',
	        owner => 'root',
	        group => 'root',
	        mode => '644',
	        ensure => 'file',
		}

	package { 'openprinting-ppds': 
		ensure => 'installed',
		}


	class { '::cups':
	  default_queue => 'KONICA_MINOLTA_287',
		}
	

	cups_queue { 'KONICA_MINOLTA_287':
#                ensure  => 'printer',
                uri     => 'ipp://192.168.1.130/ipp',
                ppd     => '/usr/share/ppd/custom/KO367GX.ppd',
                accepting    => 'true',
                enabled => 'true',
                options => {
                #       'PageSize'      => 'A4',
                #       'KMDuplex'      => 'True',
                #       'Resolution'    => '600dpi',
                        'PrinterHDD'    => 'None',
			'Model' => '287',
			}
                }

	cups_queue { 'Kyocera-Kyocera-FS-4200DN':
		ensure 	=> 'printer',
		uri 	=> 'ipp://192.168.1.199/ipp',
		model	=> 'openprinting-ppds:0/ppd/openprinting/Kyocera/en/Kyocera_FS-4200DN.ppd',
		make_and_model => 'Kyocera FS-4200DN (KPDL)',
		accepting => 'true',
		enabled	  => 'true',

		}
		

	
}

class printer::kyocera {

	file { '/usr/share/ppd/custom/KO367GX.ppd':
	        source => 'puppet:///files/KO367GX.ppd',
	        owner => 'root',
	        group => 'root',
	        mode => '644',
	        ensure => 'file',
		}

	package { 'openprinting-ppds':  
                ensure => 'installed', 
                }

	class { '::cups':
		default_queue => 'Kyocera-Kyocera-FS-4200DN',
		}
	

	cups_queue { 'KONICA_MINOLTA_287':
#                ensure  => 'printer',
                uri     => 'ipp://192.168.1.130/ipp',
                ppd     => '/usr/share/ppd/custom/KO367GX.ppd',
                accepting    => 'true',
                enabled => 'true',
                options => {
                #       'PageSize'      => 'A4',
                #       'KMDuplex'      => 'True',
                #       'Resolution'    => '600dpi',
                #       'PrinterHDD'    => 'False',
                #        'Model' => '287',
                        }
                }


	cups_queue { 'Kyocera-Kyocera-FS-4200DN':
        	        ensure  => 'printer',
        	        uri     => 'ipp://192.168.1.199/ipp',
        	        model   => 'openprinting-ppds:0/ppd/openprinting/Kyocera/en/Kyocera_FS-4200DN.ppd',
        	        make_and_model => 'Kyocera FS-4200DN (KPDL)',
        	        accepting     => 'true',
        	        enabled       => 'true',

                }




}

