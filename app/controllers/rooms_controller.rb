class RoomsController < ApplicationController

    def index
        @current_user = current_user
        redirect_to '/signin' unless @current_user
        @rooms = Room.public_rooms
        @users = User.all_except(@current_user)
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
        set_notifications_to_read
      
        render "index"
      end

    def create
        @room = Room.create(name: params["room"]["name"])
    end
    

    private 
    def room_params
        params.require(:room).permit(:name)
    end

    def set_notifications_to_read
        notifications = Notification.where(recipient: current_user).unread 
        notifications.each do |notification|
           if notification.params[:message].room == @single_room
             notification.update(read_at: Time.zone.now)
           end
        end
    end
end
