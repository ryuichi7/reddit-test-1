require 'rails_helper'

RSpec.describe Api::V1::SubRedditPostsController, type: :controller do

  describe 'GET #index', vcr: true do
    context 'success' do
      let!(:post) do
        SubRedditPost.create(
          title: 'test',
          content: 'test content',
          sub_reddit: SubReddit.create(title: 'test')
        )
      end

      let(:valid_response) do
        {
          'id' => post.id,
          'title' => post.title,
          'content'=> post.content
        }
      end

      it 'responds with status ok' do
        get :index
        expect(response).to have_http_status 200
      end

      it 'responds with json object' do
        get :index
        expect(JSON.parse(response.body)).to eq([valid_response])
      end
    end
  end
end
