class ForgotPasswordController < ApplicationController
	
   skip_before_filter :authorize

	def create
			@user = User.find_by_email(params[:email])
			@user.send_password_reset if @user
			render :json => {
				            :responseCode => "200",
	                        :responseMessage => "Email sent with password reset instructions."							
						  	}
	end

	def edit
			@user = User.find_by_password_reset_token(params[:password_reset_token])
			if @user.nil?
				render :text => {		      	
		           				:responseMessage => "You password reset token is expired. Please try again"							
							    }
    	end							   
	end

	def update
	    	@user = User.find_by_password_reset_token(params[:user][:password_reset_token])
	     if @user.password_reset_sent_at > Time.zone.now + 2.hours
	    	@user.password_reset_token = nil
    		   render :json => {
							  	:responseCode => "400",
	                         	:responseMessage => "You password reset token is expired. Please try again"					
							   }
	  elsif @user.update_attributes(:password => Digest::SHA1.hexdigest(params[:user][:password]))
			@user.password_reset_token = nil
			@user.password_reset_created_at = Time.now.utc
			@user.save
			   render :json => {
							     :responseCode => "200",
	                             :responseMessage => "Password has been reset successfully"							
							    }
	   else
	           render :json => {
							    :responseCode => "0",
	                            :responseMessage => "cant change"		
		                        }
	    end
	end		
end				