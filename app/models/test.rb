class Test < ApplicationRecord
    has_many :questions , dependent: :destroy
    has_many :submits 
    has_many :assignments , dependent: :destroy
    belongs_to :user
    has_many :blanks , dependent: :destroy
    has_many :truefalse , dependent: :destroy
    has_many :finals
    has_many :results
end