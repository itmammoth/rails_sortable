class OtherItem < ActiveRecord::Base
  include RailsSortable::Model
  set_sortable :sequence, silence_recording_timestamps: true

  default_scope -> { order(:sequence) }
end
