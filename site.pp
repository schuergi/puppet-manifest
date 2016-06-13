# site.pp must exist (puppet #15106, foreman #1708)
#node fai-server {
#}

node fai-server {
	# Configure puppetdb and its underlying database
	class { 'puppetdb': }
	
	# Configure the Puppet master to use puppetdb
	class { 'puppetdb::master::config': }

	class { 'puppetboard':
	  manage_git        => true,
	  manage_virtualenv => true,
		}

	class { 'apache': }
	class { 'apache::mod::wsgi': }
	# Configure Puppetboard
	# Access Puppetboard through pboard.example.com
	class { 'puppetboard::apache::vhost':
		 vhost_name => 'puppetboard.fai-server.lan',
		 port       => 80,
		}
	}
