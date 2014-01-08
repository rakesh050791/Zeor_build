class UsersController < ApplicationController
 	
	def create
		@user = User.new(params[:user])
		@user.password = Digest::SHA1.hexdigest(params[:password])
		@user.send_confirmation_token 
		if @user.save
			render :json =>{:msg => "You have succesfully Signed Up"}
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
		end
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
