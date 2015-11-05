class AddRoutesCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :routes_count, :integer, :default => 0

    User.reset_column_information
    User.all.each do |u|
      User.update_counters u.id, :routes_count => u.routes.length
    end
  end
end
