require "spec_helper"

describe CommentLikesController do
  describe "routing" do

    it "routes to #index" do
      get("/comment_likes").should route_to("comment_likes#index")
    end

    it "routes to #new" do
      get("/comment_likes/new").should route_to("comment_likes#new")
    end

    it "routes to #show" do
      get("/comment_likes/1").should route_to("comment_likes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/comment_likes/1/edit").should route_to("comment_likes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/comment_likes").should route_to("comment_likes#create")
    end

    it "routes to #update" do
      put("/comment_likes/1").should route_to("comment_likes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/comment_likes/1").should route_to("comment_likes#destroy", :id => "1")
    end

  end
end
