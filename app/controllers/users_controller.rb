class UsersController < ApplicationController

    def create
      user = User.find_by(user_params)
        if user.present?
            flash[:info] = "Hello, to your page!!" 
        else
          user = User.new(user_params)
          user.save
          flash[:success]="Welcome to our Channel !!"
        end
        respond_to do |format| 
          session[:user_id] = user.id
          @users = User.all
          format.html{redirect_to root_path}
         end  
    end

    def logout
      session.delete(:user_id)
      redirect_to root_path
    end

    private 
    def user_params 
        params.require(:user).permit(:username)
    end
end
