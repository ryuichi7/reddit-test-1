require 'rails_helper'

RSpec.describe SubReddits::GetReddit do
  let(:reddit) { 'UnsentLetters' }
  let(:service) { SubReddits::GetReddit.new(reddit: reddit) }

  describe '#about', vcr: true do
    it 'returns a json object' do
      response = service.about
      expect(JSON.parse(response.body)['data']['url']).to eq "/r/#{reddit}/"
    end

    it 'returns a 200 response' do
      expect(service.about.code).to eq 200
    end
  end

  describe '#posts', vcr: true do
    it 'returns a json object' do
      expect(service.posts.parsed_response).to include /kind/
    end

    it 'returns a 200 response' do
      response = service.posts
      expect(response.code).to eq 200
    end

    it 'limits posts to 25 by default' do
      response = service.posts
      expect(
        JSON.parse(response.body).dig('data', 'children').count
      ).to eq 25
    end

    context 'when a limit is passed in' do
      let(:service) { SubReddits::GetReddit.new(reddit: reddit, limit: 5) }

      it 'limits to number in args' do
        response = service.posts
        expect(
          JSON.parse(response.body).dig('data', 'children').count
        ).to eq 5
      end
    end
  end
end
