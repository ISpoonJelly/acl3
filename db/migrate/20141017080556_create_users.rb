class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false
      t.string :encrypted_password, null: false
      t.string :gender
      t.string :city
      t.string :country
      t.string :avatar
      t.date :date_of_birth

      #Foreign Keys
      t.integer :post_id
      t.integer :comment_id
      t.integer :message_id
      t.integer :friendship_id
      t.integer :friend_id
      t.integer :inverse_friendship_id
      t.integer :inverse_friend_id

      t.timestamps
    end
    
    add_index :users, :email, unique: true
  end
end
