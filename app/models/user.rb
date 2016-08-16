class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 has_one :profile
 has_many :services
 has_many :sent_reviews, class_name: 'Review', foreign_key: 'sender_id'
 has_many :received_reviews, class_name: 'Review', foreign_key: 'recipient_id'
 has_many :bookings
end
