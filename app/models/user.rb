class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/ }
  
  has_many :favorites, dependent: :destroy
  
  # お気に入りを一つでもしているか確認する
  def favorites?
    self.favorites.exists?
  end
end
