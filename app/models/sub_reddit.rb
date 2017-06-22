class SubReddit < ApplicationRecord
  has_many :sub_reddit_posts
  has_many :sub_reddit_comments, through: :sub_reddit_posts
end
