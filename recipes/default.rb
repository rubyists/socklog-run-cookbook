#
# Cookbook Name:: socklog-run
# Recipe:: default
#
# Copyright 2012, Tj Vanderpoel
#
# See LICENSE at the top level directory
#
package "socklog-run" do
  action :install
end

link "/var/log/kernel" do
  to "/var/log/socklog-klog/main/current"
end

%w{ftp local news auth cron syslog mail daemon user debug}.each do |logdir|
  file "/var/log/#{logdir}" do
    action :delete
    backup 1
    not_if { File.directory?("/var/log/#{logdir}") || (File.exists?("/var/log/#{logdir}") && File.symlink?("/var/log/#{logdir}")) }
  end

  link "/var/log/#{logdir}" do
    to "/var/log/socklog/#{logdir}/current"
    not_if { File.directory?("/var/log/#{logdir}") || (File.exists?("/var/log/#{logdir}") && File.symlink?("/var/log/#{logdir}")) }
  end
end

