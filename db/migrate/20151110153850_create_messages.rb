class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    	t.string :text, null: false
    	t.integer :user_id, null: false
    	t.integer :receiver_id, null: false

      	t.timestamps null: false
    end
  end
end
