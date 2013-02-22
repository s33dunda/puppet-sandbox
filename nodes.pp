#
# nodes.pp - defines all puppet nodes
#

# self-manage the puppet master server
node 'puppet' {
  include stdlib
}

##### CLIENTS

node 'mysql' {
  include stdlib
  class { 'helloworld': }
  class { 'mysql': }
  class { 'mysql::server':
    config_hash => { 'root_password' => 'wgu' }
  }
  class { 'mysql::python': }
}

node 'mongodb' {
  include stdlib
  class { 'mongodb': }
}

node 'apache2' {
  include stdlib
  class { 'apache': }
  class { 'apache::mod::php': }
}

node 'dev' {
  include stdlib
  class { 'dev' : } 
}
