class Test < ApplicationRecord
    has_many :questions, dependent: :destroy
    has_many :submits
    has_many :assignments, dependent: :destroy
    belongs_to :user
    has_many :blanks, dependent: :destroy
    has_many :truefalse, dependent: :destroy
    has_many :finals
    has_many :results
    has_many :attempts
  
    def self.ransackable_associations(auth_object = nil)
      %w[questions submits assignments blanks truefalse finals results attempts user]
      # Add all associations that you want to be searchable here
    end
  end
  