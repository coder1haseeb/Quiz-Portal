class AddFieldsAgainToAttemptAgain < ActiveRecord::Migration[7.0]
  def change
    add_column :attempts, :question_id, :integer
    add_column :attempts, :entered_answer, :string
    add_column :attempts, :option_id, :integer
    add_column :attempts, :blank_id, :integer
    add_column :attempts, :entered_blank, :string
    add_column :attempts, :truefalse_id, :integer
    add_column :attempts, :entered_state, :boolean
  end
end
