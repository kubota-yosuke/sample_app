class Vehicle < ApplicationRecord
  mount_uploader :vehicle_image, VehicleImageUploader
  belongs_to :user
  has_many :chats, dependent: :destroy

  validates :vehicle_name, presence: true
  validates :description, presence: true
end
