class AddsAnnouncementRevealDate < ActiveRecord::Migration
  def change
    add_column :announcements, :reveal_date, :datetime
  end
end
