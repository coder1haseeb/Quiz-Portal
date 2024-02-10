class AddTestIdToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :test_id, :integer
  end
end
