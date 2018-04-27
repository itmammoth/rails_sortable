class MultipleClassesController < ApplicationController
  # GET /multiple_classes
  def index
    @items = (FirstItem.all + SecondItem.all).sort_by(&:sort)
  end
end
