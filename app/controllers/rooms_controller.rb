class RoomsController < ApplicationController

    def index
        @rooms = Room.all
        @users = User.all
    end
    
    def show
        @room = Room.find(params[:id])
        @rooms = Room.all
        @users = User.all
        render :index
    end

    def create
        room = Room.new(room_params)
        room.user = User.find(session[:user_id])
        respond_to do |format|
            if room.save!
              @rooms = Room.all
              format.turbo_stream
              format.html{redirect_to root_path}
           else 
            flash[:danger]="Failed to save a new room !! Please try again."
            format.html{redirect_to root_path}
           end
        end
    end

    private 
    def room_params
        params.require(:room).permit(:name)
    end
end
