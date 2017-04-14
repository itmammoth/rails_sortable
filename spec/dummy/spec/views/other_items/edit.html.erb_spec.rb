require 'spec_helper'

describe "other_items/edit" do
  before(:each) do
    @other_item = assign(:other_item, stub_model(OtherItem,
      :title => "MyString",
      :sequence => 1
    ))
  end

  it "renders the edit other_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", other_item_path(@other_item), "post" do
      assert_select "input#other_item_title[name=?]", "other_item[title]"
      assert_select "input#other_item_sequence[name=?]", "other_item[sequence]"
    end
  end
end
