require 'spec_helper'

def create_token(klass, id)
  return SortableController::VERIFIER.generate("class=#{klass},id=#{id}")
end

describe SortableController, type: :controller do
  describe 'POST reorder' do
    before do
      @item1 = Item.create!
      @item2 = Item.create!
      @item3 = Item.create!
    end
    it 'should reorder models' do
      data = [
        create_token('Item', @item1.to_param),
        create_token('Item', @item3.to_param),
        create_token('Item', @item2.to_param),
      ]
      if Gem::Version.new(Rails.version) < Gem::Version.new(5)
        post :reorder, rails_sortable: data
      else
        post :reorder, params: { rails_sortable: data }
      end
      expect(response.body).to be_blank
      expect(Item.find(@item1.id).sort).to eql 0
      expect(Item.find(@item2.id).sort).to eql 2
      expect(Item.find(@item3.id).sort).to eql 1
    end
  end

  describe 'POST reorder with multiple classes' do
    before do
      @first_item1 = FirstItem.create!
      @first_item2 = FirstItem.create!
      @second_item1 = SecondItem.create!
      @second_item2 = SecondItem.create!
    end
    it 'should reorder models' do
      data = [
        create_token('SecondItem', @second_item2.to_param),
        create_token('FirstItem', @first_item2.to_param),
        create_token('FirstItem', @first_item1.to_param),
        create_token('SecondItem', @second_item1.to_param),
      ]
      if Gem::Version.new(Rails.version) < Gem::Version.new(5)
        post :reorder, rails_sortable: data
      else
        post :reorder, params: { rails_sortable: data }
      end
      expect(response.body).to be_blank
      expect(SecondItem.find(@second_item2.id).sort).to eql 0
      expect(FirstItem.find(@first_item2.id).sort).to eql 1
      expect(FirstItem.find(@first_item1.id).sort).to eql 2
      expect(SecondItem.find(@second_item1.id).sort).to eql 3
    end
  end
end
