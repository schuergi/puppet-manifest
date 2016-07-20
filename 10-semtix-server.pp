class semtix::server {	

	# Configure the Puppet master to use puppetdb
	class { 'puppetdb::master::config': 
		puppetdb_server => 'gretel.semtix',
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
		proxy_requests => 'On',
		}

	# Configure Puppetboard
	# Access Puppetboard through pboard.example.com
	class { 'puppetboard::apache::vhost':
		 vhost_name => 'puppetboard.gretel.semtix',
		 port       => 80,
		}

}
