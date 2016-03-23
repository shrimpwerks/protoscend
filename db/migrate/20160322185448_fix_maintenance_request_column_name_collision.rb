class FixMaintenanceRequestColumnNameCollision < ActiveRecord::Migration
  def change
    rename_column :maintenance_requests, :type, :issue
  end
end
