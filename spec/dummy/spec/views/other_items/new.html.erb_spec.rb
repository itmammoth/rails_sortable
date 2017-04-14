require 'spec_helper'

describe "other_items/new" do
  before(:each) do
    assign(:other_item, stub_model(OtherItem,
      :title => "MyString",
      :sequence => 1
    ).as_new_record)
  end

  it "renders new other_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", other_items_path, "post" do
      assert_select "input#other_item_title[name=?]", "other_item[title]"
      assert_select "input#other_item_sequence[name=?]", "other_item[sequence]"
    end
  end
end
