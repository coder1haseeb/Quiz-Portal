class AddMarksToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :marks, :integer
  end
end
