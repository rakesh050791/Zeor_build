class ContactsController < ApplicationController

def contact
    	@contact = Contact.new(params[:contact])
		if @contact.save
			render :json => {
							:responseCode => "200",
							:responseMessage => "Your query has been posted successfully"	
							}
		else
			render :json => {
							:responseCode => "500",
							:responseMessage => "Sorry! Try again"	
						     } 
		end
	end
end