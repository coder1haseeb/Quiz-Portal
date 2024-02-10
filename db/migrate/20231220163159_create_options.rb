class CreateOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :options do |t|
      t.string :option_key
      t.string :option_text
      t.integer :question_id

      t.timestamps
    end
  end
end
