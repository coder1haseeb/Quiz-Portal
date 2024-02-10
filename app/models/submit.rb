class Submit < ApplicationRecord
    # belongs_to :question
    belongs_to :user 
    belongs_to :test
    # belongs_to :blank
    belongs_to :question, optional: true
    belongs_to :blank, optional: true
    belongs_to :truefalse, optional: true
    # belongs_to :final
end