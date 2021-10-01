class Place < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :image, presence: true
  validates :kind, presence: true
  validates :exit_num, presence: true
  
  has_many :favorites, dependent: :destroy
  
  # kind(building -> 0, landmark -> 1)
  
  #モデルとの関連付け　mount_uploader :carrierwave用に作ったカラム名, carrierwaveの設定ファイルのクラス名
  mount_uploader :image, ImageUploader
  
  #kindに整数を割り当てる
  enum kind: { 建物・店:0, 目印:1 }
  
  #exit_numに整数を割り当てる
  enum exit_num: { A0:0, A1:1, A2:2, A3:3, A4:4, A5:5, A6:6, A6（エレベーター）:7, A7:8, A8:9, A12:10 }
  
  def favorite_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
