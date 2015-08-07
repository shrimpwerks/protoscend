class CreateAssignedRoutes < ActiveRecord::Migration
  def change
    create_table :assigned_routes do |t|
      t.references :users
      t.string :gym
      t.string :grade
      t.integer :completed
      t.integer :hidden
      t.timestamps null: false
    end
  end
end
