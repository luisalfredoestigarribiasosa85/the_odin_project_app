class User < ApplicationRecord
  has_many :cars
  has_one_attached :avatar
  has_rich_text :bio
  validates :username, :email, :password, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
