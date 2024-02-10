class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, uniqueness: true
  has_one_attached :image
  has_many :submits
  scope :admins, -> { where(role: 'admin') }
  scope :normalUsers, -> { where(role: 'user') }
  has_many :assignments , dependent: :destroy
  has_many :tests
  has_many :finals
  has_many :results
end