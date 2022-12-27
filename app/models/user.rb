class User < ApplicationRecord
  has_many :vehicles, dependent: :destroy
  
  authenticates_with_sorcery!
end
