class AddHiddenToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :hidden, :integer, :default => 0
  end
end
