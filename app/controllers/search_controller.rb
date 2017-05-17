class SearchController < ApplicationController

		def show
			@rental = Rental.new
			@filterrific = initialize_filterrific(
				Rental,
				params[:filterrific],

				select_options: {
				search_query:	Rental.search
					
						}
				) or return
			@rentals = @filterrific.find.page params[:page]
		#	@rentals = Rental.find.page params[:page]
	  	respond_to do |format|
			format.html
			format.js
			end
		end
	end
