class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :password
      t.integer :user_level
      t.references :small_groups
      t.integer :hidden
      t.timestamps null: false
    end
  end
end
