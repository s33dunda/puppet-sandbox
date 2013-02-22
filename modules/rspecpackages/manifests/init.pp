class rspecpackages {
  
  $apts = [ "git-core", "rubygems1.8", "ruby", "ruby1.8-dev", "libopenssl-ruby1.8", "puppet-lint" ]
  $gems = [  "gem-man", "templater", "rspec", "rspec-puppet" ]  

  Package { ensure => "installed" }

  package { $apts: }

  package { $gems:
    provider => gem,
  }
}
