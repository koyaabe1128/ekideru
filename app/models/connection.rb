class Connection < ApplicationRecord
  belongs_to :place
  belongs_to :exit
  
  validates :place_id, presence: true
  validates :exit_id, presence: true, uniqueness: { scope: :place_id }
end
