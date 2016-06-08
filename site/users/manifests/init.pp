class users{
  
  user { 'tyrontest':
    ensure      => present,
    managehome  => true
  }
  
}
