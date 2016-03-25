class EditMaintenanceRequestsTableStatusColumn < ActiveRecord::Migration
  def change
    rename_column :maintenance_requests, :resolved, :status
  end
end
