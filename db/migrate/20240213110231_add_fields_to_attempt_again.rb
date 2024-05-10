class AddFieldsToAttemptAgain < ActiveRecord::Migration[7.0]
  def change
    add_column :attempt_agains, :question_id, :integer
    add_column :attempt_agains, :entered_answer, :string
    add_column :attempt_agains, :option_id, :integer
    add_column :attempt_agains, :blank_id, :integer
    add_column :attempt_agains, :entered_blank, :string
    add_column :attempt_agains, :truefalse_id, :integer
    add_column :attempt_agains, :entered_state, :boolean
  end
end
