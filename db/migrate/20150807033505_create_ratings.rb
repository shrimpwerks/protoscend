class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :routes
      t.references :users
      t.integer :rating
      t.timestamps null: false
    end
  end
end
