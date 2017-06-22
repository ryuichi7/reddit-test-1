require 'rails_helper'

RSpec.describe SubReddits::GetReddit do
  let(:reddit) { 'UnsentLetters' }
  let(:service) { SubReddits::GetReddit.new(reddit) }

  describe '#call', vcr: true do
    it 'returns a json object' do
      expect(service.call.parsed_response).to include /kind/
    end

    it 'returns a new subreddit object' do
      expect(service.call.code).to eq 200
    end
  end
end
