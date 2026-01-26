class MessagesController < ApplicationController
    def create
        @chat_room = ChatRoom.find(params[:chat_room_id])
        @message = @chat_room.messages.build(message_params)
        @message.user = current_user # Aquí le decimos quién es el autor

        if @message.save
            redirect_to @chat_room
        else
            # Por ahora solo redirigimos, luego usaremos Turbo
            redirect_to @chat_room, alert: "No se pudo enviar el mensaje."
        end
    end

    private

    def message_params
        params.require(:message).permit(:body)
    end
end
