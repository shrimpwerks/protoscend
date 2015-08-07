class CreateMaintenanceRequests < ActiveRecord::Migration
  def change
    create_table :maintenance_requests do |t|
      t.references :routes
      t.references :users
      t.string :reason, :limit => 500
      t.integer :resolved, :default => 0
      t.integer :priority
      t.timestamps null: false
    end
  end
end
