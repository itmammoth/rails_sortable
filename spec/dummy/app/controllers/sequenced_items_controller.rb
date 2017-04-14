class SequencedItemsController < ApplicationController
  before_action :set_sequenced_item, only: [:show, :edit, :update, :destroy]

  # GET /sequenced_items
  def index
    @sequenced_items = SequencedItem.all
  end

  # GET /sequenced_items/1
  def show
  end

  # GET /sequenced_items/new
  def new
    @sequenced_item = SequencedItem.new
  end

  # GET /sequenced_items/1/edit
  def edit
  end

  # POST /sequenced_items
  def create
    @sequenced_item = SequencedItem.new(sequenced_item_params)

    if @sequenced_item.save
      redirect_to @sequenced_item, notice: 'Other item was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /sequenced_items/1
  def update
    if @sequenced_item.update(sequenced_item_params)
      redirect_to @sequenced_item, notice: 'Other item was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /sequenced_items/1
  def destroy
    @sequenced_item.destroy
    redirect_to sequenced_items_url, notice: 'Other item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sequenced_item
      @sequenced_item = SequencedItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sequenced_item_params
      params.require(:sequenced_item).permit(:title, :sequence)
    end
end
