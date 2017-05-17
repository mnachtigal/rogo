class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.string :rental_listing
      t.string :addr_street_name
      t.integer :addr_street_num
      t.integer :addr_zip
      t.string :addr_city
      t.string :addr_state
      t.string :addr_country
      t.string :phone_number
      t.string :dets_description
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
