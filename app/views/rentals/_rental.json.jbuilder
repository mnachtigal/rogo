json.extract! rental, :id, :rental_listing, :addr_street_name, :addr_street_num, :addr_zip, :addr_city, :addr_country, :phone_number, :dets_company_owned, :dets_description, :description, :created_at, :updated_at
json.url rental_url(rental, format: :json)
