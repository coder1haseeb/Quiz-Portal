class CreateAttempts < ActiveRecord::Migration[7.0]
  def change
    create_table :attempts do |t|
      t.integer :trail
      t.integer :submit_id

      t.timestamps
    end
  end
end
