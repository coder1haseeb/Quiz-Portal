class AddFieldsToTest < ActiveRecord::Migration[7.0]
  def change
    add_column :tests, :retake_status, :boolean
  end
end
