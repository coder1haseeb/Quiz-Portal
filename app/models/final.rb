class Final < ApplicationRecord
    # has_many :submits , dependent: :destroy
    belongs_to :user
    belongs_to :test
end
