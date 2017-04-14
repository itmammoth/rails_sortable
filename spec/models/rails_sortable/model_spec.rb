require 'spec_helper'

describe RailsSortable::Model, type: :model do

  describe "before_create" do
    context "when sort is nil" do
      it "should be automatically set maximum sort value" do
        Item.create! sort: 1000
        new_item = Item.create!
        expect(new_item.sort).to eql 1001
      end
    end
    context "when sort has value" do
      it "should not set sort value" do
        item = Item.create! sort: 1000
        expect(item.sort).to eql 1000
      end
    end
  end

  describe "set_sortable" do
    describe "attribute" do
      it "should change sort_attribute" do
        other_item = SequencedItem.create!
        expect(other_item.sequence).to eql(1)
      end
    end

    describe "silence_recording_timestamps" do
      context "when optional value is true" do
        before do
          Item.class_eval do
            set_sortable :sort, silence_recording_timestamps: true
          end
        end
        it "should NOT modify timestamps" do
          item = Item.create!
          expect { item.update_sort!(1000) }.to_not change(item, :updated_at)
        end
      end

      context "when optional value is NOT true" do
        before do
          Item.class_eval do
            set_sortable :sort, silence_recording_timestamps: false
          end
        end
        it "should modify timestamps" do
          item = Item.create!
          expect { item.update_sort!(1000) }.to change(item, :updated_at)
        end
      end
    end
  end
end
