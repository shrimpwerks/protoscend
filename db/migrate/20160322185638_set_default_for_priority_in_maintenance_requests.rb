class SetDefaultForPriorityInMaintenanceRequests < ActiveRecord::Migration
  def change
    change_column :maintenance_requests, :priority, :integer, :default => 0
  end
end
