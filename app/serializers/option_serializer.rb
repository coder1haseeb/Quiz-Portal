class OptionSerializer < ActiveModel::Serializer
  attributes *Option.column_names
  belongs_to :question
end
