require 'spec_helper'

describe SortableHelper, type: :helper do

  describe "#sortable_fetch" do

    class ARDummy
      alias_method :id, :object_id
    end

    context "with no block" do
      it { expect { helper.sortable_fetch(Array.new) }.to raise_error('You must call with block!') }
    end

    context "with block" do
      it "should yield item and its object id" do
        obj = ARDummy.new
        sortable_fetch([ obj ]) do |item, id|
          expect(item).to eq obj
          expect(id).to eq "ARDummy_#{obj.id}"
        end
      end
    end
  end
end
