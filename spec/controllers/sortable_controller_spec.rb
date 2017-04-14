require 'spec_helper'

describe SortableController, type: :controller do
  describe "POST reorder" do
    before do
      @item1 = Item.create!
      @item2 = Item.create!
      @item3 = Item.create!
    end
    it "should reorder models" do
      post :reorder, Item: [@item1.id, @item3.id, @item2.id]
      expect(response.body).to be_blank
      expect(Item.find(@item1.id).sort).to eql 0
      expect(Item.find(@item2.id).sort).to eql 2
      expect(Item.find(@item3.id).sort).to eql 1
    end
  end
end
