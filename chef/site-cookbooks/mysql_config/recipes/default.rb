
version = '5.5'
# node['mysql']['server_root_password'] = 'change me'

node.default['mysql'] = {
    'server_root_password' => 'change me'
}
mysql_client 'default' do
  version version
  action [:create]
end

mysql_service 'default' do
  version version
  port '3306'
  initial_root_password node['mysql']['server_root_password']
  action [:create, :start]
end

mysql_config 'foo' do
  instance 'default'
  source 'my.conf.erb'
  version '5.5'
  action :create
end