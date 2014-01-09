class ApplicationController < ActionController::Base
  #protect_from_forgery 

   before_filter :current_user 
  
   private

   def current_user	   
    	@current_user ||= session[:user_id] && User.find_by_id(session[:user_id])    	
   end


	before_filter :authorize
	  protected

	  def authorize
	    unless User.find_by_id(session[:user_id])
	      render :json => {:responseCode => "401", :responseMessage => "Please login again your session has been expired."}
	    end
	  end

   # before_filter :authenticate_user

  #   def authenticate_user
  #   	user = User.find_by_email(email)
	 # 	if user && user.password.eql?(Digest::SHA1.hexdigest(password))
	 # 		user
	 # 	else
	 # 		false
	 # 	end
  # end



 end
