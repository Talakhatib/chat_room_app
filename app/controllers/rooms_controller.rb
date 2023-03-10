class RoomsController < ApplicationController

    def index
        @current_user = current_user
        redirect_to '/signin' unless @current_user
        @rooms = Room.public_rooms
        @users = User.all_except(@current_user)
        @current_user.update!(online: "")
        @room = Room.new
    end

    def new
        @room = Room.new
    end

    def show
        @current_user = current_user
        @single_room = Room.find(params[:id])
        @rooms = Room.public_rooms
        @users = User.all_except(@current_user)
        @room = Room.new
        @message = Message.new
        @messages = @single_room.messages
        @current_user.update!(online: @single_room.name)
        # set_notifications_to_read
      
        render "index"
      end

    def create
        @room = Room.create(name: params["room"]["name"])
        redirect_to rooms_path
    end
    

    private 
    def room_params
        params.require(:room).permit(:name)
    end

    def set_notifications_to_read
        notifications = MessagNotification.where(user: current_user,room: @single_room,read_at: nil)
        notifications.each do |notification|
            notification.update(read_at: Time.zone.now)
        end
    end
end
