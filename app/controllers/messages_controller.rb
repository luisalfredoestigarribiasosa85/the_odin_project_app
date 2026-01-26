class MessagesController < ApplicationController
    def create
        @chat_room = ChatRoom.find(params[:chat_room_id])
        @message = @chat_room.messages.build(message_params)
        @message.user = current_user # Aquí le decimos quién es el autor

        if @message.save
            # No ponemos redirect_to. Rails buscará create.turbo_stream.erb
            # que es el archivo que se encarga de actualizar la vista
            # sin recargar la página.
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def message_params
        params.require(:message).permit(:body)
    end
end
