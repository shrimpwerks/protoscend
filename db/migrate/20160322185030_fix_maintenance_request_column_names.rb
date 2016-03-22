class FixMaintenanceRequestColumnNames < ActiveRecord::Migration
  def change
    rename_column :maintenance_requests, :users_id, :user_id
    rename_column :maintenance_requests, :routes_id, :route_id
  end
end
