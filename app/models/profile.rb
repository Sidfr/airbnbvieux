class Profile < ApplicationRecord
  belongs_to :user
  validates :expert, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :user, presence: true

end
