class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle

  validates :body, presence: true
end
