class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false, index: true
      t.string :email, null: false
      t.string :job
      t.text :interests

      t.timestamps null: false
    end
  end
end
