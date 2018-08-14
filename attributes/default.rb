cookbook_name = 'datadog'
default[cookbook_name]['datadog_api_key'] = ENV['BARITO_DATADOG_API_KEY']
default[cookbook_name]['datadog_hostname'] = ''
default[cookbook_name]['datadog_config_path'] = '/etc/datadog-agent'
