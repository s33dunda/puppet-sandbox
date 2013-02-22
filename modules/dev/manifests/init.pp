class dev {
  package { 'git-core':
    ensure => present,
  } 
  
  package { 'rubygems1.8':
    ensure => present,
  }

  package { 'ruby':
    ensure => present,
  }

  package { 'ruby1.8-dev':
    ensure => present
  }
		
  package { 'libopenssl-ruby1.8':
    ensure => present,
  }

  package { 'gem-man':
    ensure => present,
    provider => 'gem',
    require => Package['rubygems1.8'],
  }

  package { 'templater':
    ensure => present,
    provider => 'gem',
    require => Package['rubygems1.8'],
  }

  package { 'rspec':
    ensure => present,
    provider => 'gem',
    require => Package['rubygems1.8'],
  }
}
