class CreateFriendLinks < ActiveRecord::Migration
  def change
    create_table :friend_links do |t|
      t.integer :requester_id
      t.integer :requested_id
      t.string :status

      t.timestamps null: false
    end
    add_index :friend_links, :requester_id
    add_index :friend_links, :requested_id
    add_index :friend_links, [:requester_id, :requested_id], unique: true
  end
end
