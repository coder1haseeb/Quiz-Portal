class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.boolean :status
      t.integer :user_id
      t.integer :test_id

      t.timestamps
    end
  end
end
