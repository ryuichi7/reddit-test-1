require 'rails_helper'

RSpec.describe Api::V1::SubRedditCommentsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # SubRedditComment. As you add validations to SubRedditComment, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET #index" do
    it "returns a success response" do
      sub_reddit_comment = SubRedditComment.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      sub_reddit_comment = SubRedditComment.create! valid_attributes
      get :show, params: {id: sub_reddit_comment.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      sub_reddit_comment = SubRedditComment.create! valid_attributes
      get :edit, params: {id: sub_reddit_comment.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new SubRedditComment" do
        expect {
          post :create, params: {sub_reddit_comment: valid_attributes}, session: valid_session
        }.to change(SubRedditComment, :count).by(1)
      end

      it "redirects to the created sub_reddit_comment" do
        post :create, params: {sub_reddit_comment: valid_attributes}, session: valid_session
        expect(response).to redirect_to(SubRedditComment.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {sub_reddit_comment: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested sub_reddit_comment" do
        sub_reddit_comment = SubRedditComment.create! valid_attributes
        put :update, params: {id: sub_reddit_comment.to_param, sub_reddit_comment: new_attributes}, session: valid_session
        sub_reddit_comment.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the sub_reddit_comment" do
        sub_reddit_comment = SubRedditComment.create! valid_attributes
        put :update, params: {id: sub_reddit_comment.to_param, sub_reddit_comment: valid_attributes}, session: valid_session
        expect(response).to redirect_to(sub_reddit_comment)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        sub_reddit_comment = SubRedditComment.create! valid_attributes
        put :update, params: {id: sub_reddit_comment.to_param, sub_reddit_comment: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested sub_reddit_comment" do
      sub_reddit_comment = SubRedditComment.create! valid_attributes
      expect {
        delete :destroy, params: {id: sub_reddit_comment.to_param}, session: valid_session
      }.to change(SubRedditComment, :count).by(-1)
    end

    it "redirects to the sub_reddit_comments list" do
      sub_reddit_comment = SubRedditComment.create! valid_attributes
      delete :destroy, params: {id: sub_reddit_comment.to_param}, session: valid_session
      expect(response).to redirect_to(sub_reddit_comments_url)
    end
  end

end
