class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :entered_answer, limit: 1
      t.string :correct_option, limit: 1

      t.timestamps
    end
  end
end
