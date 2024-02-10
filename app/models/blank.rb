class Blank < ApplicationRecord
    belongs_to :test
    validates :blank, presence: true, format: { with: /__blank__/ }
    has_many :submits , dependent: :destroy
end
