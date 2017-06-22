module SubReddits
  class GetReddit
    include HTTParty
    base_uri 'https://www.reddit.com/r'

    def initialize(reddit)
      @reddit = reddit
    end

    def call
      self.class.get("/#{reddit}/about.json")
    end

    private

    attr_accessor :reddit
  end
end
