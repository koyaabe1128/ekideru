class Place < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :image, presence: true
  validates :kind, presence: true
  validates :exit_num, presence: true
  
  # kind(building -> 0, landmark -> 1)
  
  #モデルとの関連付け　mount_uploader :carrierwave用に作ったカラム名, carrierwaveの設定ファイルのクラス名
  mount_uploader :image, ImageUploader
end
