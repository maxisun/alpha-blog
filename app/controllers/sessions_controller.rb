class SessionsController < ApplicationController

    def new
    end

    def create 
      user = User.find_by(email: params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        session[:current_user_id] = user.id
        flash[:success] = "Log in successful"  
        redirect_to user_path(user)
      else
        flash.now[:danger] = "There was something wrong with your login information"
        render 'new'
      end
    end

    def destroy
      session[:current_user_id] = nil
      flash[:success] = "You have logged out"
      redirect_to root_path
    end
end