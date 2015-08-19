mysql_service 'default' do
  version '5.5'
  port '3306'
  action [:create, :start]
end

mysql_config 'foo' do
  instance 'default'
  source 'my.conf.erb'
  version '5.5'
  action :create
end