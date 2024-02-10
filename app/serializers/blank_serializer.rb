class BlankSerializer < ActiveModel::Serializer
  attributes *Blank.column_names
  belongs_to :question
end
