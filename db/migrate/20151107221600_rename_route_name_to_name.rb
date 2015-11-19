class RenameRouteNameToName < ActiveRecord::Migration
  def change
    rename_column :routes, :route_name, :name
  end
end
