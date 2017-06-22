class CreateSubRedditPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_reddit_posts do |t|
      t.references :sub_reddit, foreign_key: true

      t.timestamps
    end
  end
end
