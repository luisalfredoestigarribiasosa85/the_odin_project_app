class ChatRoomsController < ApplicationController
    before_action :authenticate_user!

    def index
        @chat_rooms = current_user.chat_rooms
    end

    def show
        @chat_room = ChatRoom.find(params[:id])
        @messages = @chat_room.messages
        @message = Message.new #Crea un nuevo mensaje
    end

    def create
        @car = Car.find(params[:car_id]) #Busca el auto por el id que viene en los parametros
        @chat_room = ChatRoom.find_or_create_by(car: @car, #Busca el chatroom por el id del auto, el id del comprador y el id del vendedor
            buyer: current_user,
            seller: @car.user) #Busca el vendedor por el id del auto
        redirect_to @chat_room #Redirige al chatroom
    end
end