class nginx::params {
	
	case $::osfamily {
    'redhat', 'debian': {
      $confdir = '/etc/nginx'
      $logdir = '/var/log/nginx'
    }
    'windows': {
      $confdir = 'C:/ProgramData/nginx'
      $logdir = 'C:/ProgramData/nginx/logs'
    }
  }
  
}
