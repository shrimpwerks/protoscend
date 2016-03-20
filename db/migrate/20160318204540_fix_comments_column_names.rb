class FixCommentsColumnNames < ActiveRecord::Migration
  def change
    rename_column :comments, :users_id, :user_id
    rename_column :comments, :routes_id, :route_id
  end
end
