class ChangeRatingsTable < ActiveRecord::Migration
  def change
    rename_column :ratings, :users_id, :user_id
    rename_column :ratings, :routes_id, :route_id
  end
end
