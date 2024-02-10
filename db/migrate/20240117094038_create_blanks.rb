class CreateBlanks < ActiveRecord::Migration[7.0]
  def change
    create_table :blanks do |t|
      t.string :blank
      t.string :correct_blank
      t.integer :test_id
      t.integer :marks

      t.timestamps
    end
  end
end
