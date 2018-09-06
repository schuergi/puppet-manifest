class semtix::client::wakeonlan {

	$ifs = split($facts[interfaces], ',')

        file {'/etc/systemd/system/wol@.service':
                ensure => 'file',
                source => 'puppet:///files/wol@.service',
                mode => '644',
                owner => 'root',
                group => 'root',
                }

        service { "wol@${ifs[0]}":
                ensure => 'true',
                enable => 'true',
                provider => 'systemd',
                }

}
