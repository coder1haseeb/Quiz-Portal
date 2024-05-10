class AddFieldsToSubmit < ActiveRecord::Migration[7.0]
  def change
    add_column :submits, :trail, :integer
  end
end
