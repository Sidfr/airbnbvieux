class Profile < ApplicationRecord
  has_many :services, through: :users
  belongs_to :user
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :user, presence: true

end
