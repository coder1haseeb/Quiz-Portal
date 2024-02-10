class TruefalseSerializer < ActiveModel::Serializer
  attributes *Truefalse.column_names
  belongs_to :test
  has_many :submits
end
