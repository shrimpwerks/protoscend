class ModifyAnnouncementsTable < ActiveRecord::Migration
  def change
    rename_column :announcements, :announcement, :body
    add_column :announcements, :expires_at, :datetime
    add_column :announcements, :subject, :varchar
    add_column :announcements, :hidden, :integer, :default => 0
    # add_column :announcements, :user_id, :integer
    add_reference :announcements, :user, index: true
    add_column :users, :announcements_count, :integer, :default => 0
  end
end
