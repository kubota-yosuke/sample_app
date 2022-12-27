class Vehicle < ApplicationRecord
  belongs_to :user

  validates :vehicle_name, presence: true
  validates :description, presence: true
end
