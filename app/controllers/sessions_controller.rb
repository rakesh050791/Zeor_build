class SessionsController < ApplicationController
  
  before_filter :authorize
  
    def create
      user = User.authenticate(params[:email],params[:password])
      if user.confirmation_token.nil?	
         if user
     	      session[:user_id] = user.id
         	  render :json => {
                            :responseCode => "200",
                            :responseMessage => "You have logged in successfully",
                            # :current_user => current_user
                            }
          else
     	      render :json => {
                             :responseCode => "500",
                             :responseMessage => "Invalid Attempt! Please try again"
                            }
          end
          else
            render :json => {
                             :responseCode => "500",
                             :responseMessage => "You are not a confirmed user.Please confirm your account before login."
                            }
          end    
   end

    def destroy
        unless current_user.nil?
          user = User.find(current_user.id)
          session[:user_id] = nil
      	  render :json => {
                            :responseCode => "200",
                            :responseMessage => "You have logged out successfully"
                          }
        else
          render :json => {
                            :responseCode => "500",
                            :responseMessage => "You are not logged In."
                          }
        end                  
      end
end
