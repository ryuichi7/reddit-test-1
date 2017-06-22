class CreateSubReddits < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_reddits do |t|
      t.string :name
      t.timestamps
    end
  end
end
