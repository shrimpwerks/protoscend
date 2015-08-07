class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :routes
      t.references :users
      t.string :comment
      t.timestamps null: false
    end
  end
end
