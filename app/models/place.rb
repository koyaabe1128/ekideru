class Place < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  # validates :image, presence: true
  validates :kind, presence: true
  validates :exit_num, presence: true
  
  # kindは１がbuilding(建物)で２がlandmark(目印)
end
