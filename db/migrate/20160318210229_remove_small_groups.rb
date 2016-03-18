class RemoveSmallGroups < ActiveRecord::Migration
  def change
    drop_table :small_groups
    remove_column :users, :small_groups_id 
  end
end
