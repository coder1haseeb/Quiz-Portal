class AddTestIdToSubmits < ActiveRecord::Migration[7.0]
  def change
    add_column :submits, :test_id, :integer
  end
end
