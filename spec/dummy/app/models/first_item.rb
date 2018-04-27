class FirstItem < ActiveRecord::Base
  include RailsSortable::Model
  set_sortable :sort

  default_scope -> { order(:sort) }
end
