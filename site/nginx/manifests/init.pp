class nginx ( $owner = 'root' ) {

  case $::osfamily {
    'redhat', 'debian': {
      $confdir = '/etc/nginx'
    }
    'windows': {
      $confdir = 'C:/ProgramData/nginx'
    }
  }
  
  File {
    owner => $owner,
    group => 'root',
  }
  
  package { 
    'nginx':ensure => present,
  }

  file { '/var/www':
    ensure => directory,
    mode => '0775',
  }

  file {'/var/www/index.html':
    ensure => file,
    mode => '0664',
    source => 'puppet:///modules/nginx/index.html',
  }
  
  file { "${confdir}/nginx.conf":
    ensure => file,
    mode => '0664',
    #source =>'puppet:///modules/nginx/nginx.conf',
    content =>  template('nginx/nginx.conf.erb'),
    require => Package['nginx'],
    notify => Service['nginx'],
  }
  
  file { "${confdir}/conf.d":
    ensure=> directory,
    mode=> '0775',
  }
  
  file { "${confdir}/conf.d/default.conf":
    ensure => file,
    mode => '0664',
    source => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
    notify => Service['nginx']
  }
  
  service { 'nginx':
    ensure=> running,
    enable => true,
  }
}
