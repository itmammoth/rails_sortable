require 'spec_helper'

describe "other_items/show" do
  before(:each) do
    @other_item = assign(:other_item, stub_model(OtherItem,
      :title => "Title",
      :sequence => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/1/)
  end
end
