#
# Cookbook Name:: chainer
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
packages = %w{
  gcc-c++ numpy scipy python-matplotlib ipython
  python-pandas sympy python-nose
}
packages.each do |pkg|
  package "#{pkg}" do
    action :install
    #options "--enablerepo=epel"
  end
end

execute "Install Six" do
  command <<-EOH
    pip install https://pypi.python.org/packages/c8/0a/b6723e1bc4c516cb687841499455a8505b44607ab535be01091c0f24f079/six-1.10.0-py2.py3-none-any.whl#md5=3ab558cf5d4f7a72611d59a81a315dc8
  EOH
end

execute "Install chainer" do
  command <<-EOH
    pip install chainer
  EOH
end
