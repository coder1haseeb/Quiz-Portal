class AddFieldsToAttempt < ActiveRecord::Migration[7.0]
  def change
    add_column :attempts, :test_id, :integer
    add_column :attempts, :user_id, :integer
  end
end
