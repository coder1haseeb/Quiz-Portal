class Question < ApplicationRecord
    has_many :options , dependent: :destroy
    has_many :submits , dependent: :destroy
    belongs_to :test
end