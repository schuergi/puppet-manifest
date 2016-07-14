class semtix::client::software {
	
	package { 'pdfchain':
		ensure => latest,
		}

	package { 'cifs-utils':
		ensure => latest,
		}
}
