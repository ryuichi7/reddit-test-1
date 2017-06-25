require 'rails_helper'

RSpec.describe SubReddits::Create do
  let(:reddit) { 'UnsentLetters' }
  let(:service) { SubReddits::Create.new(title: reddit, limit: 1) }

  describe '#call', vcr: true do
    context 'success' do
      it 'creates new reddit' do
        expect { service.call }.to change(SubReddit, :count).by 1
      end

      it 'creates new reddit posts' do
        expect { service.call }.to change(SubRedditPost, :count).by 1
      end

      it 'returns result struct' do
        response = service.call
        expect(response.is_a?(Struct)).to be true
      end

      it 'returns successful' do
        response = service.call
        expect(response.successful?).to be true
      end

      it 'assigns posts to reddit' do
        response = service.call
        expect(response.body.sub_reddit_posts).to eq([SubRedditPost.last])
      end
    end
  end
end
