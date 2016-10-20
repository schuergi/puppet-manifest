class printer::judith {

	file { '/usr/share/ppd/custom/KO367GX.ppd':
	        source => 'puppet:///files/KO367GX.ppd',
	        owner => 'root',
	        group => 'root',
	        mode => '644',
	        ensure => 'file',
		}

	file { '/usr/share/ppd/custom/Kyocera_FS-4200DN.ppd':
		source => 'puppet:///files/Kyocera_FS-4200DN.ppd',
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
			'Duplex' => 'DuplexTumble',
                #       'PageSize'      => 'A4',
                        'KMDuplex'      => '2sided',
                #       'Resolution'    => '600dpi',
                        'PrinterHDD'    => 'None',
			'Model' => '287',
			'Binding' => 'LeftBinding',
		
			}
                }

	cups_queue { 'Kyocera-Kyocera-FS-4200DN':
	#	ensure 	=> 'printer',
		uri 	=> 'ipp://192.168.1.199/ipp',
		ppd => '/usr/share/ppd/custom/Kyocera_FS-4200DN.ppd',
#		model	=> 'openprinting-ppds:0/ppd/openprinting/Kyocera/en/Kyocera_FS-4200DN.ppd',
#		make_and_model => 'Kyocera FS-4200DN (KPDL)',
		accepting => 'true',
		enabled	  => 'true',
		options => {
			'KMDuplex' => '2sided',
			}

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

	file { '/usr/share/ppd/custom/Kyocera_FS-4200DN.ppd':
                source => 'puppet:///files/Kyocera_FS-4200DN.ppd',
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
 #               ensure  => 'printer',
                uri     => 'ipp://192.168.1.130/ipp',
                ppd     => '/usr/share/ppd/custom/KO367GX.ppd',
                accepting    => 'true',
                enabled => 'true',
                options => {
                #       'PageSize'      => 'A4',
                        'Duplex' => 'DuplexTumble',             
                        'KMDuplex'      => '2sided',
                #       'Resolution'    => '600dpi',
                #       'PrinterHDD'    => 'False',
                        'Model' => '287',
                                
                        }
                }


	cups_queue { 'Kyocera-Kyocera-FS-4200DN':
        #	        ensure  => 'printer',
        	        uri     => 'ipp://192.168.1.199/ipp',
        	        ppd     => '/usr/share/ppd/custom/Kyocera_FS-4200DN.ppd',
	       #	        model   => 'openprinting-ppds:0/ppd/openprinting/Kyocera/en/Kyocera_FS-4200DN.ppd',
        	#        make_and_model => 'Kyocera FS-4200DN (KPDL)',
        	        accepting     => 'true',
        	        enabled       => 'true',
			options => {
                       'KMDuplex' => '2sided',
                        }
                }




}

