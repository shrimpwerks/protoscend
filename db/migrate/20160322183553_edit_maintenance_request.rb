class EditMaintenanceRequest < ActiveRecord::Migration
  def change
    add_column :maintenance_requests, :type, :integer, :default => 3
  end
end
