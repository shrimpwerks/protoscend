class AddDescriptionToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :description, :text
  end
end
