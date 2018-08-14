#
# Cookbook:: datadog-cookbook
# Recipe:: default
#
# Copyright:: 2018, BaritoLog, All Rights Reserved.
api_key = node[cookbook_name]['datadog_api_key']
user = node[cookbook_name]['user']
group = node[cookbook_name]['group']
datadog_config_path = node[cookbook_name]['datadog_config_path']

execute 'Install Datadog agent' do
  command "DD_API_KEY=#{api_key} DD_INSTALL_ONLY=true bash -c \"$(curl -L https://raw.githubusercontent.com/DataDog/datadog-agent/master/cmd/agent/install_script.sh)\""
  user user
  group group
end

template "#{datadog_config_path}/datadog.yaml" do
  source 'datadog.yaml.erb'
  owner 'dd-agent'
  group 'dd-agent'
  model '640'
end

execute 'Start Datadog agent' do
  command 'sudo systemctl restart datadog-agent.service'
  user 'root'
  group 'root'
end

