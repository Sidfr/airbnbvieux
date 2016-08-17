class Profile < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :user, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
