class AddImagesToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :image_1, :string, :default => ""
    add_column :routes, :image_2, :string, :default => ""
  end
end
