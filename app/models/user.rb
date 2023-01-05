class User < ApplicationRecord
  has_many :vehicles, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_vehicles, through: :likes, source: :vehicle
  has_many :chats, dependent: :destroy

  authenticates_with_sorcery!

  def like(vehicle)
    like_vehicles << vehicle
  end

  def own?(object)
    id == object.user_id
  end
end
