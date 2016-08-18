class Profile < ApplicationRecord
  belongs_to :user
  has_many :reviews, through: :users
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :user, presence: true

end
