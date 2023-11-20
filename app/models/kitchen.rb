class Kitchen < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :address, presence: true
  validates :capacity, presence: true
  validates :price, presence: true
end
