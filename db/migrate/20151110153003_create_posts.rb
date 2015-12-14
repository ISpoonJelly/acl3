class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :body
    	t.integer :likes, default: 0
    	t.integer :commentCount, default: 0

      #Foreign Keys
    	t.integer :comment_id
    	t.integer :user_id

    	t.timestamps null: false
    end
  end
end
