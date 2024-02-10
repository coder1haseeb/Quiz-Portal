class AddOptionIdToSubmit < ActiveRecord::Migration[7.0]
  def change
    add_column :submits, :option_id, :integer
  end
end