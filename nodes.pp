#
# nodes.pp - defines all puppet nodes
#

# self-manage the puppet master server
node 'puppet' { }

##### CLIENTS

node 'mysql' {
  class { 'helloworld': }
  class { 'mysql': }
  class { 'mysql::server':
    config_hash => { 'root_password' => 'wgu' }
  }
  class { 'mysql::python': }
}

node 'mongodb' { 
  class { 'mongodb': }
}

node 'apache2' { 

#  class { 'apache': }
#  class { 'apache::mod::php': }
}
