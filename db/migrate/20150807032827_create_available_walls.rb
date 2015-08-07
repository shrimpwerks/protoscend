class CreateAvailableWalls < ActiveRecord::Migration
  def change
    create_table :available_walls do |t|
      t.string :location
      t.integer :wall_id
      t.integer :available
    end
  end
end
