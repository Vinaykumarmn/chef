package "apache2" do
  action :install
end
service "apache2" do
  action [:start,:enable]
end
node["mail"]["sites"].each do |sitename, data|
  document_root = "/var/www/html/#{sitename}"
  directory document_root do
   mode "0755"
   recursive true
 end
template "/etc/apache2/sites-available/#{sitename}.conf" do
   source "virtualhost.erb"
   mode "0644"
   variables(
      :document_root => document_root,
      :port => data["port"],
      :serveradmin => data["serveradmin"], 
      :servername => data["servername"]
 )
notifies :restart, "service[apache2]"
  end 
end
 
