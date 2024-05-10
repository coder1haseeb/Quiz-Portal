class Attempt < ApplicationRecord
    belongs_to :test
    belongs_to :submit
    belongs_to :user
end
