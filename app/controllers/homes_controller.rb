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

	def category
		@categories = Category.all
		unless @categories.empty?
			a = []
			@categories.each do |cat|
			 		a << cat.title
			end
				 render :json => a
			else
			    render :json => {
						:responseCode => "500",
						:responseMessage => "No such result found"	
	 						     }
	 	    end
	end

	def sub_category
		@sub_categories = SubCategory.find_all_by_category_id(params[:id])
		unless @sub_categories.empty?
			b = []
			@sub_categories.each do |cat|
			 		b << cat.title
			end
				 render :json => b.as_json
			else
			    render :json => {
						:responseCode => "500",
						:responseMessage => "No such result found"	
	 						     }
	 	    end
	end
	
end
