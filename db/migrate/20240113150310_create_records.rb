class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.integer :total_answer
      t.integer :test_id
      t.integer :user_id

      t.timestamps
    end
  end
end
