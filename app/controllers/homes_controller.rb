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
						:responseMessage => @privacy.first.description
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
			 @categories.each do |cat|
			   cat[:id] = cat.id
			   cat[:title] = cat.title
			   cat[:description] = cat.description
		      end
				 render :json => {
						:responseCode => "200",
						:responseMessage => @categories.as_json(:only =>[:id,:title,:description])	
	 						     }
		else
			    render :json =>  {
						:responseCode => "500",
						:responseMessage => "No such result found"	
	 						     }
	 	end
	end

	def sub_category
		@sub_categories = SubCategory.find_all_by_category_id(params[:id])
		unless @sub_categories.empty?
			@sub_categories.each do |cat|
			   cat[:id] = cat.id
			   cat[:title] = cat.title
			   cat[:description] = cat.description
			end
				 render :json => {
						:responseCode => "200",
						:responseMessage => @sub_categories.as_json(:only =>[:id,:title,:description])	
	 						     }
		else
			    render :json =>  {
						:responseCode => "500",
						:responseMessage => "No such result found"	
	 						     }
	 	end
	end

	def item
		@items = Item.find_all_by_sub_category_id(params[:id])
		unless @items.empty?
			@items.each do |item|
		    item[:id] = item.id		
			item[:title] = item.title
			end
			   render :json =>  {
						:responseCode => "200",
						:responseMessage => @items.as_json(:only =>[:id,:title])	
	 						    }
		else
			    render :json =>  {
						:responseCode => "500",
						:responseMessage => "No such result found"	
	 						     }
	 	end
	end

	def item_record
		@items = Item.find_all_by_id(params[:id])
		unless @items.empty?
			 @items.each do |item|
			     # item[:id] = item.id				 	 
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
