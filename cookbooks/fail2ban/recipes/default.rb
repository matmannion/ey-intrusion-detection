#
# Cookbook Name:: fail2ban
# Recipe:: default
#

# Dependency on iptables
include_recipe "iptables"

if ['solo', 'app', 'util', 'app_master', 'db_master', 'db_slave'].include?(node[:instance_role])
	include_recipe "fail2ban::install"
	include_recipe "fail2ban::config"

	# Start the fail2ban service
	service "fail2ban" do
		supports :restart => true
		action [:enable, :start]
	end
end