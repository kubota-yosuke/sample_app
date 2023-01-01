class Like < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle

  validates :user_id, uniqueness: { scope: :vehicle_id }
end
