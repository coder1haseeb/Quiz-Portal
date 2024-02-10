class TestSerializer < ActiveModel::Serializer
  attributes *Test.column_names
  has_many :questions
  has_many :blanks
  has_many :truefalse
end
