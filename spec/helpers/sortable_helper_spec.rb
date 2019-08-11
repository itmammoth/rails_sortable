require 'spec_helper'

describe SortableHelper, type: :helper do

  describe "#sortable_fetch" do

    context "with no block" do
      it { expect { helper.sortable_fetch(Array.new) }.to raise_error('Must be called with block!') }
    end

    context "with block" do
      it "should yield item and its object id" do
        new_item = Item.create!
        sortable_fetch([ new_item ]) do |item, id|
          expect(item).to eq new_item
          expect(id).to eq SortableController::VERIFIER.generate("class=Item,id=#{new_item.id}")
        end
      end
    end
  end
end
