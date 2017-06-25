class AddTitleAndCOntentToSubRedditPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :sub_reddit_posts, :title, :string
    add_column :sub_reddit_posts, :content, :text
  end
end
