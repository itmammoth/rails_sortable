require 'spec_helper'

describe "other_items/index" do
  before(:each) do
    assign(:other_items, [
      stub_model(OtherItem,
        :title => "Title",
        :sequence => 1
      ),
      stub_model(OtherItem,
        :title => "Title",
        :sequence => 1
      )
    ])
  end

  it "renders a list of other_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
