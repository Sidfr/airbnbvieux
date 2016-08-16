class Availability < ApplicationRecord
  belongs_to :service

  validates :startdate, presence: true
  validates :enddate, presence: true
  validates :service, presence: true
end
