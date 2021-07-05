class SortableController < ApplicationController

  VERIFIER = Rails.application.message_verifier(:rails_sortable_generate_sortable_id)

  #
  # post /sortable/reorder, rails_sortable: [
  #   "BAhJIhVjbGFzcz1JdGVtLGlkPTUwBjoGRVQ=--b48adfad6d6d7764e4106c44fc090fcad15d721e",
  #   "BAhJIhVjbGFzcz1JdGVtLGlkPTQxBjoGRVQ=--ac1c2d3b8eae8dd72e49fae302005e5ae4fc00a4", ...]
  # Param `rails_sorable` is an array object containing encoded tokens,
  # and each token must be able to be decoded with VERIFIER to a string formatted as "class={CLASS_NAME},id={ID}".
  #
  def reorder
    ActiveRecord::Base.transaction do
      params['rails_sortable'].each.with_index(1) do |token, new_sort|
        next unless token.present?

        model = find_model(token)
        current_sort = model.read_attribute(model.class.sort_attribute)
        model.update_sort!(new_sort) if current_sort != new_sort
      end
    end

    head :ok
  end

private

  def find_model(token)
    klass, id = VERIFIER.verify(token).match(/class=(.+),id=(.+)/)[1..2]
    klass.constantize.find(id)
  end
end
