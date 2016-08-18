class Service < ApplicationRecord
  belongs_to :user
  has_many :availabilities
  belongs_to :profile

  validates :description, presence: true
  validates :city, presence: true
  validates :user, presence: true

  def self.search(search)
    if search
      where("city ILIKE ?", "%#{search}%")
    else
      where(nil)
    end
  end

end
