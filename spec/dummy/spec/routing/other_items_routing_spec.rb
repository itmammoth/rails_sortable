require "spec_helper"

describe OtherItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/other_items").should route_to("other_items#index")
    end

    it "routes to #new" do
      get("/other_items/new").should route_to("other_items#new")
    end

    it "routes to #show" do
      get("/other_items/1").should route_to("other_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/other_items/1/edit").should route_to("other_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/other_items").should route_to("other_items#create")
    end

    it "routes to #update" do
      put("/other_items/1").should route_to("other_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/other_items/1").should route_to("other_items#destroy", :id => "1")
    end

  end
end
