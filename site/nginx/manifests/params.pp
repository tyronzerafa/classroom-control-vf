class nginx::params {
	
	case $::osfamily {
    'redhat', 'debian': {
      $confdir = '/etc/nginx'
      $logdir = '/var/log/nginx'
      $pidloc = '/var/run'
    }
    'windows': {
      $confdir = 'C:/ProgramData/nginx'
      $logdir = 'C:/ProgramData/nginx/logs'
      $pidloc = 'C:/ProgramData/nginx/logs'
    }
  }
  
}
