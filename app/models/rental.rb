class Rental < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	has_many :images, dependent: :destroy

	validates :rental_listing, presence: true

	geocoded_by :full_address
	after_validation :geocode

	filterrific(
  #	default_filter_params: { sorted_by: 'created_at_desc' },
  		available_filters: [
			:search_query,
 		]
	)
def self.search
  # Search
	scope :search_query, lambda { |query|
		where("rental_listing LIKE ?", "%#{query}%")
	}
end

  # Create address
	def full_address
		# street = addr_street_num.to_s + " " + addr_street_name
		if addr_street_num != nil && addr_street_name !=nil
			[addr_street_num.to_s + " " + addr_street_name, addr_city, addr_country].compact.join(', ')
		end
	end

  def get_overall
     @num_reviews = 0;
     @total_stars = 0;
     self.reviews.each do |r|
        if !r.new_record? && r.overall.present?
           @total_stars = r.overall + @total_stars;
           @num_reviews = @num_reviews + 1;
        end
     end
     if @num_reviews != 0
       return @total_stars / @num_reviews
     else
        return 0;
     end
  end





end
