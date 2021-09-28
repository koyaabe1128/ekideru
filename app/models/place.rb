class Place < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :image, presence: true
  validates :kind, presence: true
  validates :exit_num, presence: true

  # kind(building -> 0, landmark -> 1)
end
