class CreateSupportTickets < ActiveRecord::Migration
  def change
    create_table :support_tickets do |t|
      t.references :users
      t.string :ticket
      t.timestamps null: false
    end
  end
end
