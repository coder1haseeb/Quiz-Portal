class CreateFalsities < ActiveRecord::Migration[7.0]
  def change
    create_table :falsities do |t|
      t.string :statement
      t.boolean :state
      t.integer :marks
      t.integer :test_id

      t.timestamps
    end
  end
end
