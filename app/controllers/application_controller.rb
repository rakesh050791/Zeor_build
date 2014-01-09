class ApplicationController < ActionController::Base
  #protect_from_forgery 

    before_filter :current_user 


	before_filter :authorize

    def authorize
	    if user = authenticate_with_http_basic { |u, p| User.authenticate(u, p) }
	    	puts "=================================== in if"
	      @current_user = user
	    else
	    	puts "=================================== in elf"
	      request_http_basic_authentication
	    end
    end
  
   private

   def current_user	   
    	@current_user ||= session[:user_id] && User.find_by_id(session[:user_id])    	
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
