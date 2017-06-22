class CreateSubRedditComments < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_reddit_comments do |t|
      t.references :sub_reddit_post, foreign_key: true

      t.timestamps
    end
  end
end
