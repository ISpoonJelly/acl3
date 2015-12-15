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
      t.integer :destination_post_id
      t.integer :comment_id
      t.integer :message_id
      t.integer :followed_id

      t.timestamps
    end
    
    add_index :users, :email, unique: true
  end
end
