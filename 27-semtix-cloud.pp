class semtix::client::cloud {
  
  package {'davfs2':
    ensure => latest,
  }
  
  file {'/etc/davfs2/secrets':
    ensure  => file,
    source => 'puppet:///files/secrets',
    mode => '0600',
    owner => 'root',
    group => 'root',
  }
  
  file {'/etc/systemd/system/media-cloud.mount':
    ensure  => file,
    source => 'puppet:///files/media-cloud.mount',
  }

  file {'/etc/systemd/system/media-cloud.automount':
    ensure  => file,
    source => 'puppet:///files/media-cloud.automount',
  }
  
  service { 'media-cloud.automount':
    enable => true,
  }
}
