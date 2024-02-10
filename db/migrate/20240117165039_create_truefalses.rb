class CreateTruefalses < ActiveRecord::Migration[7.0]
  def change
    create_table :truefalses do |t|
      t.string :statement
      t.boolean :state
      t.integer :test_id
      t.integer :marks

      t.timestamps
    end
  end
end
