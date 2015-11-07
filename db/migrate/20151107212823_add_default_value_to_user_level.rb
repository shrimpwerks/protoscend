class AddDefaultValueToUserLevel < ActiveRecord::Migration
  def change
    change_column :users, :user_level, :integer, default: 1
  end
end
