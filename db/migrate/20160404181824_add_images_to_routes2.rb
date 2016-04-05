class AddImagesToRoutes2 < ActiveRecord::Migration
  def change
    remove_column :routes, :image_1
    remove_column :routes, :image_2
    add_attachment :routes, :image_1
    add_attachment :routes, :image_2
  end
end
