class SortableController < ApplicationController
  #
  # post /sortable/reorder, :klass => ["1", "3", "2"]
  #
  def reorder
    klass, ids = parse_params
    models = klass.order(:sort).to_a
    ids.each_with_index do |id, new_sort|
      model = models.find {|m| m.id == id }
      model.update_sort!(new_sort) if model.sort != new_sort
    end
    render nothing: true
  end

private

  def parse_params
    klass_name = params.keys.first
    ids = params[klass_name].map {|id| id.to_i }
    [ klass_name.constantize, ids ]
  end
end