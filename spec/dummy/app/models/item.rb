class Item < ActiveRecord::Base
  default_scope -> { order(:sort) }
end
