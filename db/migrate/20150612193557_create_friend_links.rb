class CreateFriendLinks < ActiveRecord::Migration
  def change
    create_table :friend_links do |t|
      t.integer :user_id
      t.integer :friend_id
      t.string :status

      t.timestamps null: false
    end
    add_index :friend_links, :user_id
    add_index :friend_links, :friend_id
    add_index :friend_links, [:user_id, :friend_id], unique: true
  end
end
