class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :post
    	t.string :tags
    	t.integer :likes
    	t.string :attachment
    	t.integer :user_id
      	t.timestamps null: false
    end
  end
end
