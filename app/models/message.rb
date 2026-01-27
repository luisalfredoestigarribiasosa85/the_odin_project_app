class Message < ApplicationRecord
  belongs_to :chat_room
  belongs_to :user

  # Aqui ocurre la magia de ActionCable
  after_create_commit -> {
    broadcast_append_to chat_room,
    target: "messages" }
end
