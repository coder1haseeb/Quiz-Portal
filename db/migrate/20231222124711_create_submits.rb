class CreateSubmits < ActiveRecord::Migration[7.0]
  def change
    create_table :submits do |t|
      t.integer :question_id
      t.string :entered_answer
      t.integer :user_id

      t.timestamps
    end
  end
end