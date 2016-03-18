class ChangeRoutesGradeType < ActiveRecord::Migration
  def change
    remove_column :routes, :grade
    add_column :routes, :grade, :integer
  end
end
