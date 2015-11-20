class ChangeAssignedRoutesDefaultValues < ActiveRecord::Migration
  def change
    change_column_default :assigned_routes, :completed, 0
    change_column_default :assigned_routes, :hidden, 0
  end
end
