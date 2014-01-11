class HomesController < ApplicationController
    before_filter :authorize

	def terms
		@terms = Terms.all
		unless @terms.empty?
		  render :json => @terms.first.description
	                     
	     else
	      render :json => {
	       		    :responseCode => "500",
	                :responseMessage => 'No Request found'
	                      }
	     end
	end

    def privacy
		@privacy = Privacy.all
		unless @privacy.empty?
		  render :json => @privacy.first.description
	     else
	      render :json => {
	       		    :responseCode => "500",
	                :responseMessage => 'No Request found'
	                      }
	     end
	end
end
