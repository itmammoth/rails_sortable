class SortableController < ApplicationController
  #
  # post /sortable/reorder, rails_sortable: { klass: ["1", "3", "2"] }
  #
  def reorder
    klass, ids = parse_params
    attr = klass.sort_attribute
    ActiveRecord::Base.transaction do
      id_to_model = klass.find(ids).index_by(&:id)
      ids.each_with_index do |id, new_sort|
        model = id_to_model[id]
        model.update_sort!(new_sort) if model.read_attribute(attr) != new_sort
      end
    end

    head :ok
  end

private

  def parse_params
    rails_sortable_params = params['rails_sortable']
    klass_name = rails_sortable_params.keys.first
    ids = rails_sortable_params[klass_name].map {|id| id.to_i }
    [ klass_name.constantize, ids ]
  end
end
