module SubReddits
  class Create
    Result = Struct.new(:successful?, :errors, :body)
    BASE_LIMIT = 25

    def initialize(args)
      @title = args[:title]
      @service = args[:service] || set_service(args)
    end

    def call
      ActiveRecord::Base.transaction do
        create_sub_reddit
        create_posts
      end
      Result.new(true, nil, reddit)
    rescue StandardError => e
      p e
      Result.new(false, e, nil)
    end

    private

    attr_reader :title, :service, :reddit

    def about_data
      @about_data ||= service.about.parsed_response
    end

    def posts_data
      @posts_data ||= service.posts.parsed_response
    end

    def create_sub_reddit
      @reddit = SubReddit.create!(build_reddit_params)
    end

    def create_posts
      posts_data.dig('data', 'children').each do |post|
        SubRedditPost.create(build_post_params(post))
      end
    end

    def build_reddit_params
      {}.tap do |params|
        params[:title] = about_data.dig 'data', 'title'
        params[:description] = about_data.dig 'data', 'description'
        params[:sub_reddit_id] = about_data.dig 'data', 'subreddit_id'
      end
    end

    def build_post_params(post)
      {}.tap do |params|
        params[:title] = post.dig 'data', 'title'
        params[:content] = post.dig 'data', 'selftext_html'
        params[:sub_reddit_id] = reddit.id
      end
    end

    def set_service(args)
      GetReddit.new(reddit: args[:title], limit: args[:limit] || BASE_LIMIT)
    end
  end
end
