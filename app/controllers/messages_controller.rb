class MessagesController < ApplicationController

    def create
        @message = Message.new(message_params)
        @message.user =User.find(session[:user_id])
        @message.room = Room.find(params[:room])
        @message.save!
        @room = @message.room
        respond_to do |format|
            format.turbo_stream 
            format.html { redirect_to @message.room }
        end
    end

    private 
    def message_params 
        params.require(:message).permit(:content)
    end
end
