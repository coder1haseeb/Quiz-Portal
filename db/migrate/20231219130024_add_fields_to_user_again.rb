class AddFieldsToUserAgain < ActiveRecord::Migration[7.0]
  def change
    add_column :user_agains, :role, :string
  end
end
