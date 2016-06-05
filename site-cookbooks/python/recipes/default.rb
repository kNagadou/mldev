#
# Cookbook Name:: python
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
python_home = node[:python][:home]

packages = %w{
  python-pip python-wheel
}
packages.each do |pkg|
  package "#{pkg}" do
    action :install
    #options "--enablerepo=epel"
  end
end

python_packages = %w{setuptools pip pytz}
python_packages.each do |pkg|
  execute "Upgrade packages" do
    command <<-EOH
      pip install -U #{pkg}
    EOH
  end
end

python_dir = %W[#{python_home}]
python_dir.each do |dir|
  directory dir do
    recursive true
    owner "root"
    group "root"
    mode 00755
    action :create
    not_if "test -d #{dir}"
  end
end
