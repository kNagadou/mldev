#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "Update Yum" do
  command <<-EOH
    yum clean all
    yum -y update
  EOH
end

common_packages = %w{git}
common_packages.each do |pkg|
  package pkg do
    action :install
  end
end
