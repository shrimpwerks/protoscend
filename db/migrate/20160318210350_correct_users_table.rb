class CorrectUsersTable < ActiveRecord::Migration
  def change
    rename_column :users, :fname, :first_name
    rename_column :users, :lname, :last_name
    rename_column :users, :user_level, :role
  end
end
