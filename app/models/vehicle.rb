class Vehicle < ApplicationRecord
  mount_uploader :vehicle_image, VehicleImageUploader
  belongs_to :user

  validates :vehicle_name, presence: true
  validates :description, presence: true
end
