require 'rails_helper'

RSpec.describe "SubRedditComments", type: :request do
  describe "GET /sub_reddit_comments" do
    it "works! (now write some real specs)" do
      get sub_reddit_comments_path
      expect(response).to have_http_status(200)
    end
  end
end
