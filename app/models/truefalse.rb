class Truefalse < ApplicationRecord
    belongs_to :test
    has_many :submits , dependent: :destroy
end
