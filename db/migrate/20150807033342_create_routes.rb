class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :route_name
      t.references :users
      t.references :available_walls
      t.string :location
      t.string :tape_color
      t.string :grade
      t.date :route_set_date
      t.date :expiration_date
      t.timestamps null: false
    end
  end
end
