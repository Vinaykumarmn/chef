#
# Cookbook Name:: mail
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

execute "update" do
  command "apt-get update"
  action :run
end
