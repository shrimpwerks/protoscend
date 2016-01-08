class ChangeDefaultValueOfAvailableWalls < ActiveRecord::Migration
  def change
    change_column_default :available_walls, :available, 1
  end
end
