class Option < ApplicationRecord
  belongs_to :question

  validates :option_key, length: { maximum: 1, message: "Option key must be one character long" }
  validates :option_key, uniqueness: { scope: :question_id, message: "Option key already exists for this question" }
end
