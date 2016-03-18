class ChangeRoutesLabelField < ActiveRecord::Migration
  def change
    # remove_index :routes, name: :available_walls_id
    rename_column :routes, :available_walls_id, :label
  end
end
