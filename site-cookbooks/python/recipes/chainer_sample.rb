#
# Cookbook Name:: python
# Recipe:: chainer
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "python::default"

python_home = node[:python][:home]
chainer_git_repo = node[:python][:chainer][:git_repo]

git "git clone chainer sample" do
  repository "#{chainer_git_repo}"
  reference "master"
  destination "#{python_home}/chainer"
  action :sync
  not_if "test -d chainer"
end
