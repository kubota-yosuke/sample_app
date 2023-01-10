class Vehicle < ApplicationRecord
  mount_uploader :vehicle_image, VehicleImageUploader
  belongs_to :user
  has_many :chats, dependent: :destroy
  has_one :matching, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :users, through: :matchings

  validates :vehicle_name, presence: true
  validates :description, presence: true

end
