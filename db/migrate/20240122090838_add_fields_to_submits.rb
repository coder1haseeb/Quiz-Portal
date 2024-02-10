class AddFieldsToSubmits < ActiveRecord::Migration[7.0]
  def change
    add_column :submits, :blank_id, :integer
    add_column :submits, :entered_blank, :string
    add_column :submits, :truefalse_id, :integer
    add_column :submits, :entered_state, :boolean
  end
end
