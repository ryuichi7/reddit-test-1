require 'rails_helper'

RSpec.describe SubReddits::Create do
  let(:reddit) { 'UnsentLetters' }
  let(:service) { SubReddits::Create.new(title: reddit) }

  describe '#call', vcr: true do
    it 'creates new reddit' do
      expect { service.call }.to change(SubReddit, :count).by 1
    end

  end
end
