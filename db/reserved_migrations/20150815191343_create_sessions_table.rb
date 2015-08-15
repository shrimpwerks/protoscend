class CreateSessionsTable < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.references :user
      t.integer  :user_level
      t.string :auth_token, default: ""
      t.timestamps null: false
    end
    add_index :sessions, :auth_token, unique: true
  end
end
