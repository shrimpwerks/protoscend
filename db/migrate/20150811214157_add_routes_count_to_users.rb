class AddRoutesCountToUsers < ActiveRecord::Migration
  def change
    # add_column :users, :route_count, :integer, :default => 0

    User.reset_column_information
    User.all.each do |u|
      User.update_counters u.id, :route_count => u.routes.length
    end
  end
end
