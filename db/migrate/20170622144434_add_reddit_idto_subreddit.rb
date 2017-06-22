class AddRedditIdtoSubreddit < ActiveRecord::Migration[5.1]
  def change
    add_column :sub_reddits, :sub_reddit_id, :string
  end
end
