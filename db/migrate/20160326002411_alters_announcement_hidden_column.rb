class AltersAnnouncementHiddenColumn < ActiveRecord::Migration
  def change
    rename_column :announcements, :hidden, :status
  end
end
