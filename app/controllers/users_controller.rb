class UsersController < ApplicationController

  before_filter :authorize,:except => [:create,:user_confirmation,:index]
 	 	 
	def create
		@user = User.new(params[:user])
		@user.password = Digest::SHA1.hexdigest(params[:password])
		@user.send_confirmation_token 
		if @user.save
			render :json => {
							 :responseCode => "200",
	                         :responseMessage => "You have successfully signed up. Your account activation link has been sent on your mail. That link is valid only for 2 hrs."							
						    }			
		else
			render :json => {:msg => "Please try again"}
		end
	end 

	def user_confirmation
	  @user = User.find_by_confirmation_token(params[:confirmation_token])
	  unless @user.nil?
		if @user.confirmation_token_sent_at < Time.zone.now + 2.hours
		   @user.confirmation_token = nil
		   @user.save
		   render :json => {
							 :responseCode => "200",
	                         :responseMessage => "Your account is successfully activated"							
						   }
		else
		   render :json => {
				    		 :responseCode => "400",
			                 :responseMessage => "Your confiramtion token is Valid only for 2 hours. It is expired now.Please try again"							
						   }
		end
	    else
		   render :json => {
							 :responseCode => "200",
	                         :responseMessage => "Your confiramtion token is expired.Please try again"							
						   }
	     end
	end	

    def update_password 
   	    @user = User.find_by_id(current_user.id)
	    if @user.password == Digest::SHA1.hexdigest(params[:old_password])
	       @user.update_attributes(:password => Digest::SHA1.hexdigest(params[:new_password]))
	       render :json => {
						    :responseCode => "200",
                            :responseMessage => "Your password has been successfully changed"							
					       }
	    else
		   render :json => {
		 				    :responseCode => "400",
                            :responseMessage => "password didnt match"							
					       }
	    end
    end   

    def index

    end     
end
