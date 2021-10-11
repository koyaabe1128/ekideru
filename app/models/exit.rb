class Exit < ApplicationRecord
  validates :number, presence: true, length: { maximum: 6 }, format: { with: /\A[a-zA-Z0-9]+\z/ }, uniqueness: true
  
  has_many :connections, dependent: :destroy
  has_many :connected_place, through: :connections, source: :place
end
