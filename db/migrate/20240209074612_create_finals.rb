class CreateFinals < ActiveRecord::Migration[7.0]
  def change
    create_table :finals do |t|
      t.integer :submit_id
      t.integer :user_id
      t.integer :test_id

      t.timestamps
    end
  end
end
