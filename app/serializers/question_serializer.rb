class QuestionSerializer < ActiveModel::Serializer
  attributes *Question.column_names
  belongs_to :test
  has_many :options
  has_many :submits
end
