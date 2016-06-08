class memcached {    
  
  package { 'memcached':
    ensure => present,
    before => File['/etc/sysconfig/memcached'],
  }
  
  file { '/etc/sysconfig/memcached':
    ensure  => file,
    source  => 'puppet:///modules/memcached/memcached',
    require => Package['memcached'],
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify => Service['memcached'],
  }
  
  service { 'memcached':
    ensure    => running,
    enable    => true,
    subscribe => File['/etc/sysconfig/memcached'],
  } 
}
