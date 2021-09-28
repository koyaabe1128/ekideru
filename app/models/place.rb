class Place < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  # validates :image, presence: true
  # validates :kind, presence: true
  validates :exit_num, presence: true

  #kindに整数を割り当てる
  enum kind: { 建物・店:0, 目印:1 }
end
