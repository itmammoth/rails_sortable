require 'active_support/configurable'

module RailsSortable
  class Configuration
    include ActiveSupport::Configurable

    config_accessor(:namespace)   { "" }
  end
end
