class HomesController < ApplicationController
    before_filter :authorize

	def terms
		@terms = Terms.all
		unless @terms.empty?
		  render :json => {
		  	      :responseCode => "200",
		  	      :responseMessage => @terms.first.description 
		                  }
	                     
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
		  render :json => {
				  	:responseCode => "200",
				  	:responseMessage  => @privacy.first.description
		  	              }
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
				 render :json => {
                    :responseCode => "200",
				 	:responseMessage => a 
				                 }
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
				 render :json => {
				 	:responseCode => "200",
				 	:responseMessage =>  b.as_json
				 	             }
			else
			    render :json => {
						:responseCode => "500",
						:responseMessage => "No such result found"	
	 						     }
	 	    end
	end

	def item
		@items = Item.find_all_by_sub_category_id(params[:id])
		unless @items.empty?
			c = []
			@items.each do |item|
			c << item.title
			end
			    render :json => {
			    			:responseCode => "200",
						    :responseMessage => c.as_json 
			    				 }
		else
			    render :json => {
						:responseCode => "500",
						:responseMessage => "No such result found"	
	 						     }
	 	end
	end

	def item_record
		@items = Item.find_all_by_id(params[:id])
		unless @items.empty?
			 @items.each do |item|
			     item[:title] = item.title
			     item[:description] = item.description
			     item[:type] = item.item_type
		     end
		         render :json => {
		         			:responseCode => "200",
						    :responseMessage => @items.as_json(:only =>[:title,:description,:type])
		         				}
	    else
			     render :json => {
							:responseCode => "500",
							:responseMessage => "No such result found"	
								 }
	    end      
	end
	
end
