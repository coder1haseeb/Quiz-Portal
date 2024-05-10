class AddFieldsToResult < ActiveRecord::Migration[7.0]
  def change
    add_column :results, :retake, :boolean
  end
end
