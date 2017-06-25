require 'rails_helper'

RSpec.describe Api::V1::SubRedditsController, type: :controller do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      sub_reddit = SubReddit.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create", vcr: true do
    context "with valid params" do
      it "creates a new SubReddit" do
        expect { post :create, params: { title: 'UnsentLetters' } }
        .to change(SubReddit, :count).by(1)
      end

      it "responds with success" do
        post :create, params: {sub_reddit: valid_attributes}, session: valid_session
        expect(response).to have_http_status :created
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {sub_reddit: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end
end
