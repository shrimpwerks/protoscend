class CreateSmallGroups < ActiveRecord::Migration
  def change
    create_table :small_groups do |t|
      t.string :group_name
      t.integer :hidden
      t.timestamps null: false
    end
  end
end
