class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true, length: { maximum: 30 }
  
  has_many :favorites, dependent: :destroy
  
  # お気に入りを一つでもしているか確認する
  def favorites?
    self.favorites.exists?
  end
end
