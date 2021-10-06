class Place < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :yomigana, presence: true, length: { maximum: 70 }
  validates :image, presence: true
  
  has_many :favorites, dependent: :destroy
  has_many :connections, dependent: :destroy
  has_many :connected_exit, through: :connections, source: :exit
  
  #モデルとの関連付け　mount_uploader :carrierwave用に作ったカラム名, carrierwaveの設定ファイルのクラス名
  mount_uploader :image, ImageUploader
  
  #exit_numに整数を割り当てる
  enum exit_num: { A0:0, A1:1, A2:2, A3:3, A4:4, A5:5, A6:6, A6（エレベーター）:7, A7:8, A8:9, A12:10 }
  
  # ユーザーからお気に入りされているか確認する
  def favorite_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  # PlaceにExitを設定する
  def connect(exit)
    self.connections.find_or_create_by(exit_id: exit.id)
  end
  
  # Placeに設定されたExitを外す
  def unconnect(exit)
    connection = self.connections.find_by(exit_id: exit.id)
    connection.destroy if connection
  end
end
