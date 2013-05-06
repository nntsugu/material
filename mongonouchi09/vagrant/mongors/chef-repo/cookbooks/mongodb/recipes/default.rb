user "mongodb" do
  comment "MongoDB User"
  uid 1000
  shell "/bin/bash"
  password "password"
end

mongo = Hash::new
mongo['root'] = '/usr/local/mongodb'

directory mongo['root'] do
  owner "root"
  group "root"
  mode 0755
  action :create
  recursive true
end


mongo['ins'] = 'mongors.1'
mongo['home'] = mongo['root']+'/'+mongo['ins']
mongo['conf'] = mongo['home']+'/conf'
mongo['product'] = mongo['home']+'/product'
mongo['data'] = mongo['home']+'/data'
mongo['log'] = mongo['home']+'/log'
mongo['script'] = mongo['home']+'/script'



directory mongo['home'] do
  owner "mongodb"
  group "mongodb"
  mode 0755
  action :create
  recursive true
end
directory mongo['conf'] do
  owner "mongodb"
  group "mongodb"
  mode 0755
  action :create
  recursive true
end
directory mongo['data'] do
  owner "mongodb"
  group "mongodb"
  mode 0755
  action :create
  recursive true
end
directory mongo['product'] do
  owner "mongodb"
  group "mongodb"
  mode 0755
  action :create
  recursive true
end
directory mongo['log'] do
  owner "mongodb"
  group "mongodb"
  mode 0755
  action :create
  recursive true
end
directory mongo['script'] do
  owner "mongodb"
  group "mongodb"
  mode 0755
  action :create
  recursive true
end
template mongo['conf']+'/'+mongo['ins']+'.conf' do
  owner "mongodb"
  group "mongodb"
  mode 0700
  source mongo['ins']+'.conf'
end
template mongo['script']+'/mongo-start' do
  owner "mongodb"
  group "mongodb"
  mode 0755
  source "mongo-start"
end

mongo['ins'] = 'mongors.2'
mongo['home'] = mongo['root']+'/'+mongo['ins']
mongo['conf'] = mongo['home']+'/conf'
mongo['product'] = mongo['home']+'/product'
mongo['data'] = mongo['home']+'/data'
mongo['log'] = mongo['home']+'/log'
mongo['script'] = mongo['home']+'/script'



directory mongo['home'] do
  owner "mongodb"
  group "mongodb"
  mode 0755
  action :create
  recursive true
end
directory mongo['conf'] do
  owner "mongodb"
  group "mongodb"
  mode 0755
  action :create
  recursive true
end
directory mongo['data'] do
  owner "mongodb"
  group "mongodb"
  mode 0755
  action :create
  recursive true
end
directory mongo['product'] do
  owner "mongodb"
  group "mongodb"
  mode 0755
  action :create
  recursive true
end
directory mongo['log'] do
  owner "mongodb"
  group "mongodb"
  mode 0755
  action :create
  recursive true
end
directory mongo['script'] do
  owner "mongodb"
  group "mongodb"
  mode 0755
  action :create
  recursive true
end
template mongo['conf']+'/'+mongo['ins']+'.conf' do
  owner "mongodb"
  group "mongodb"
  mode 0700
  source mongo['ins']+'.conf'
end
template mongo['script']+'/mongo-start' do
  owner "mongodb"
  group "mongodb"
  mode 0755
  source "mongo-start"
end

mongo['ins'] = 'mongors.3'
mongo['home'] = mongo['root']+'/'+mongo['ins']
mongo['conf'] = mongo['home']+'/conf'
mongo['product'] = mongo['home']+'/product'
mongo['data'] = mongo['home']+'/data'
mongo['log'] = mongo['home']+'/log'
mongo['script'] = mongo['home']+'/script'



directory mongo['home'] do
  owner "mongodb"
  group "mongodb"
  mode 0755
  action :create
  recursive true
end
directory mongo['conf'] do
  owner "mongodb"
  group "mongodb"
  mode 0755
  action :create
  recursive true
end
directory mongo['data'] do
  owner "mongodb"
  group "mongodb"
  mode 0755
  action :create
  recursive true
end
directory mongo['product'] do
  owner "mongodb"
  group "mongodb"
  mode 0755
  action :create
  recursive true
end
directory mongo['log'] do
  owner "mongodb"
  group "mongodb"
  mode 0755
  action :create
  recursive true
end
directory mongo['script'] do
  owner "mongodb"
  group "mongodb"
  mode 0755
  action :create
  recursive true
end


template mongo['conf']+'/'+mongo['ins']+'.conf' do
  owner "mongodb"
  group "mongodb"
  mode 0700
  source mongo['ins']+'.conf'
end

template mongo['script']+'/mongo-start' do
  owner "mongodb"
  group "mongodb"
  mode 0755
  source "mongo-start"
end

script "install_mongodb" do
  interpreter "bash"
  user "mongodb"
  group "mongodb"
  cwd "/tmp"
  code <<-EOH
  tar -zxf /vagrant/archives/mongodb-linux-i686-2.4.1.tgz
  mv mongodb-linux-i686-2.4.1/bin /usr/local/mongodb/mongors.1/product/
  tar -zxf /vagrant/archives/mongodb-linux-i686-2.4.1.tgz
  mv mongodb-linux-i686-2.4.1/bin /usr/local/mongodb/mongors.2/product/
  tar -zxf /vagrant/archives/mongodb-linux-i686-2.4.1.tgz
  mv mongodb-linux-i686-2.4.1/bin /usr/local/mongodb/mongors.3/product/
  EOH
end



script "startup_mongodb" do
  interpreter "bash"
  user "mongodb"
  group "mongodb"
  code <<-EOH
  /usr/local/mongodb/mongors.1/script/mongo-start mongors.1
  /usr/local/mongodb/mongors.2/script/mongo-start mongors.2
  /usr/local/mongodb/mongors.3/script/mongo-start mongors.3
  EOH
end