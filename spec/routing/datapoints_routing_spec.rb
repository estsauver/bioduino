require "spec_helper"

describe DatapointsController do
  describe "routing" do

    it "routes to #index" do
      get("/datapoints").should route_to("datapoints#index")
    end

    it "routes to #new" do
      get("/datapoints/new").should route_to("datapoints#new")
    end

    it "routes to #show" do
      get("/datapoints/1").should route_to("datapoints#show", :id => "1")
    end

    it "routes to #edit" do
      get("/datapoints/1/edit").should route_to("datapoints#edit", :id => "1")
    end

    it "routes to #create" do
      post("/datapoints").should route_to("datapoints#create")
    end

    it "routes to #update" do
      put("/datapoints/1").should route_to("datapoints#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/datapoints/1").should route_to("datapoints#destroy", :id => "1")
    end

  end
end
