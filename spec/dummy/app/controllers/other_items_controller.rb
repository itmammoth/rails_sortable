class OtherItemsController < ApplicationController
  before_action :set_other_item, only: [:show, :edit, :update, :destroy]

  # GET /other_items
  def index
    @other_items = OtherItem.all
  end

  # GET /other_items/1
  def show
  end

  # GET /other_items/new
  def new
    @other_item = OtherItem.new
  end

  # GET /other_items/1/edit
  def edit
  end

  # POST /other_items
  def create
    @other_item = OtherItem.new(other_item_params)

    if @other_item.save
      redirect_to @other_item, notice: 'Other item was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /other_items/1
  def update
    if @other_item.update(other_item_params)
      redirect_to @other_item, notice: 'Other item was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /other_items/1
  def destroy
    @other_item.destroy
    redirect_to other_items_url, notice: 'Other item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_other_item
      @other_item = OtherItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def other_item_params
      params.require(:other_item).permit(:title, :sequence)
    end
end
