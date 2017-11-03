class SequencedItem < ActiveRecord::Base
  include RailsSortable::Model
  set_sortable :sequence, without_updating_timestamps: true

  default_scope -> { order(:sequence) }
end
