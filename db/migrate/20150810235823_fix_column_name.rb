class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :routes, :users_id, :user_id
  end
end
