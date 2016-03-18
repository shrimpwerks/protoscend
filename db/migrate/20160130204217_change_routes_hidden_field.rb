class ChangeRoutesHiddenField < ActiveRecord::Migration
  def change
    rename_column :routes, :hidden, :status
  end
end
