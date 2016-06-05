#
# Cookbook Name:: git
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
packages = %w{
  git
}
packages.each do |pkg|
  package "#{pkg}" do
    action :install
    #options "--enablerepo=epel"
  end
end
