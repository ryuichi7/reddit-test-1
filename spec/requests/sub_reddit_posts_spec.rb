require 'rails_helper'

RSpec.describe "SubRedditPosts", type: :request do
  describe "GET /sub_reddit_posts" do
    it "works! (now write some real specs)" do
      get sub_reddit_posts_path
      expect(response).to have_http_status(200)
    end
  end
end
