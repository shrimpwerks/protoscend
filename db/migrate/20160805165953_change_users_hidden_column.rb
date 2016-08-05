class ChangeUsersHiddenColumn < ActiveRecord::Migration
  def change
    remove_column :users, :hidden
    add_column :users, :is_deleted, :boolean, default: false, null: false
  end
end
