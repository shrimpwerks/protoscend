class DropSupportTickets < ActiveRecord::Migration
  def change
    drop_table :support_tickets
  end
end
