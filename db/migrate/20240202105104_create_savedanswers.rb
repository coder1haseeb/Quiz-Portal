class CreateSavedanswers < ActiveRecord::Migration[7.0]
  def change
    create_table :savedanswers do |t|
      t.integer :question_id
      t.string :entered_answer
      t.integer :user_id
      t.integer :test_id
      t.integer :option_id
      t.integer :blank_id
      t.string :entered_blank
      t.integer :truefalse_id
      t.boolean :entered_state

      t.timestamps
    end
  end
end
