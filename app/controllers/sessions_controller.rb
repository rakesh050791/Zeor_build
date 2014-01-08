class SessionsController < ApplicationController
  	
  def create
   user = User.authenticate(params[:email],params[:password])	
   if user
   	session[:user_id] = user.id
   
   	render :json => {
                      :responseCode => "200",
                      :responseMessage => "You have logged in successfully",
                      :current_user => current_user
                    }
   else
   	false
   	render :json => {
                      :responseCode => "400",
                      :responseMessage => "Invalid Attempt! Please try again"
                    }
   end
  end

  def destroy
    user = User.find_by_id(current_user.id)
  	session[:user_id] = nil
  	render :json => {
                      :responseCode => "200",
                      :responseMessage => "You have logged out successfully"
                    }
  end

end
