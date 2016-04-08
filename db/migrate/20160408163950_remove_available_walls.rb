class RemoveAvailableWalls < ActiveRecord::Migration
  def change
    drop_table :available_walls
  end
end
