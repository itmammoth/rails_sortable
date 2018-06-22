require "rails_sortable/engine"
require "rails_sortable/core_ext"
require 'rails_sortable/configuration'

module RailsSortable
  def self.configure(&block)
    block.call configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
end
