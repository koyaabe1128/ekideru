class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :place
  
  validates :user_id, presence: true
  validates :place_id, presence: true, uniqueness: { scope: :user_id }
  
end
