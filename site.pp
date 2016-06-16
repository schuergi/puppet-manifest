# site.pp must exist (puppet #15106, foreman #1708)
#node fai-server {
#}

node fai-client {

include 'cups::'
        cups_queue { 'CUPS-PDF':
                ensure  => 'printer',
        #       ppd     => '',
                uri     => 'cups-pdf:/',
                options => {
                        'accepting'     => 'true',
                        'enabled'       => 'true',
#                        'PageSize'      => 'A4',
#                        'Duplex'        => 'true',
#                        'Resolution'    => '600dpi',
                        }
		}

}

node fai-server {
	# Configure puppetdb and its underlying database
#	class { 'puppetdb': 
#		database => 'embedded',
#		database_embedded_path => '/var/lib/puppetdb/',
#	#	disable_ssl => 'true',
#		ssl_listen_address => '0.0.0.0',
#		}
	
	# Configure the Puppet master to use puppetdb
	class { 'puppetdb::master::config': 
		puppetdb_server => 'fai-server.lan',
  		puppetdb_port   => 8081,
		}

	class { 'puppetboard':
	  manage_git        => true,
	  manage_virtualenv => true,
		}

	class { 'apache': 
		mpm_module => 'prefork',
		purge_configs => 'false',
		}

	class { 'apache::mod::wsgi': }
	class { 'apache::mod::headers': }
	class { 'apache::mod::rewrite': }
	class { 'apache::mod::php': }
	class { 'apache::mod::proxy': 
		allow_from => '0.0.0.0',
		proxy_requests => 'On'
		}
	# Configure Puppetboard
	# Access Puppetboard through pboard.example.com
	class { 'puppetboard::apache::vhost':
		 vhost_name => 'puppetboard.fai-server.lan',
		 port       => 80,
		}

}
