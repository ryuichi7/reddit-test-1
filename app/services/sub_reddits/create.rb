module SubReddits
  class Create
    def initialize(args)
      @title = args[:title]
      @service = args[:service] || GetReddit.new(title)
    end

    def call
      create_sub_reddit
    end

    private

    attr_reader :title, :service

    def response_data
      @response_data ||= service.call.parsed_response
    end

    def create_sub_reddit
      SubReddit.create(build_params)
    end

    def build_params
      {}.tap do |params|
        params[:title] = response_data.dig 'data', 'title'
        params[:description] = response_data.dig 'data', 'description'
        params[:sub_reddit_id] = response_data.dig 'data', 'subreddit_id'
      end
    end
  end
end
