class semtix::client::ssh {

  package {'openssh-server':
    ensure => latest,
  }
  
  service {'sshd':
    ensure => running,
    enable => true,
  }

  ssh_authorized_key { 'root@gretel':
    ensure => present,
    user   => 'localadmin',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCu8HdVhPEv/bITUUwqhL+d8wjwbxDJrDDhdnnxzdF+mK5wvmnkDY5I7ALY/gYk6jrSHbF3CoL8+3nP1ZpPVBYvJYr+dM8YvmGj8Qj++4JDVIYjDXghepIwxPnto25hg5R5ckoWiS3Tro9G9xydyX7WbevzWcVCpSbvqQtP8rue6oeMSktK8LPoMkBdJ00dk+/a5awCkA2tTgfahn/VFvjgYCQTVzd1jfUtq6UnV064LTXYKHjXG4sHwJtIvX8IkHPPHxlvLAflBTVdCTCRSqnTGyCZSfOwiB2KmwVb3XAnCv5MuXkP8oFU34b2AHINxI5ft5Qz+byt6eTj2A/xnNPh',
  }
  
#  user { 'localadmin':
#  ensure         => present,
#  purge_ssh_keys => true,
#  }
  
}
