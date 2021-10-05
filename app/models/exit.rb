class Exit < ApplicationRecord
  validates :number, presence: true
  
  has_many :connections, dependent: :destroy
  has_many :connected_place, through: :connections, source: :place
end
