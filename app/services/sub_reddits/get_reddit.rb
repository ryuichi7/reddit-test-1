module SubReddits
  class GetReddit
    include HTTParty
    base_uri 'https://www.reddit.com/r'
    BASE_LIMIT = 25.freeze

    def initialize(args)
      @reddit = args[:reddit]
      @options = { query: { limit: args[:limit] || BASE_LIMIT } }
    end

    def about
      self.class.get("/#{reddit}/about.json")
    end

    def posts
      self.class.get("/#{reddit}/new.json", options)
    end

    private

    attr_reader :reddit, :options
  end
end
