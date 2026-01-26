class User < ApplicationRecord
  has_many :cars
  has_many :chat_rooms_as_buyer, class_name: 'ChatRoom', foreign_key: 'buyer_id', dependent: :destroy
  has_many :chat_rooms_as_seller, class_name: 'ChatRoom', foreign_key: 'seller_id', dependent: :destroy
  has_many :messages, dependent: :destroy
  has_one_attached :avatar
  has_rich_text :bio
  validates :username, :email, :password, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def chat_rooms
    ChatRoom.where("buyer_id = ? OR seller_id = ?", id, id).order(updated_at: :desc)
  end
end
