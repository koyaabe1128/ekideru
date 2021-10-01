class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :place
  
  validates :place_id, uniqueness: { scope: :user_id }
  
end
