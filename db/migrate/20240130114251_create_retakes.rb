class CreateRetakes < ActiveRecord::Migration[7.0]
  def change
    create_table :retakes do |t|
      t.integer :user_id
      t.integer :test_id
      t.integer :obtained_marks
      t.integer :total_marks

      t.timestamps
    end
  end
end
