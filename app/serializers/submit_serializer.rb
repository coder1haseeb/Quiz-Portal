class SubmitSerializer < ActiveModel::Serializer
  attributes *Submit.column_names
  belongs_to :question
end
