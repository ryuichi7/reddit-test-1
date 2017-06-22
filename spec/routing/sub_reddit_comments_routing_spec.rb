require "rails_helper"

RSpec.describe SubRedditCommentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/sub_reddit_comments").to route_to("sub_reddit_comments#index")
    end

    it "routes to #new" do
      expect(:get => "/sub_reddit_comments/new").to route_to("sub_reddit_comments#new")
    end

    it "routes to #show" do
      expect(:get => "/sub_reddit_comments/1").to route_to("sub_reddit_comments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/sub_reddit_comments/1/edit").to route_to("sub_reddit_comments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/sub_reddit_comments").to route_to("sub_reddit_comments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/sub_reddit_comments/1").to route_to("sub_reddit_comments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/sub_reddit_comments/1").to route_to("sub_reddit_comments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sub_reddit_comments/1").to route_to("sub_reddit_comments#destroy", :id => "1")
    end

  end
end
