class FixAssignedRoutesColumnName < ActiveRecord::Migration
  def change
    rename_column :assigned_routes, :users_id, :user_id
  end
end
