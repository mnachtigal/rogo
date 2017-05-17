class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]

  # GET /rentals
  # GET /rentals.json
  def index
    @rental = Rental.new
    @filterrific = initialize_filterrific(
    	Rental,
   		params[:filterrific]
  	) or return
		@rentals = Rental.all
  end

  # GET /rentals/1
  # GET /rentals/1.json
  def show
    @review = @rental.reviews.new
    @image = @rental.images.new
  end

  # GET /rentals/new
  def new
    @rental = Rental.new
  end

  # GET /rentals/1/edit
  def edit
  end

  # POST /rentals
  # POST /rentals.json
  def create
    @rental = Rental.new(rental_params)

    respond_to do |format|
      if @rental.save

        # saving images with paperclip
        if params[:pics]
          params[:pics].each { |pic|
            # XXX this sets all default to true once can figure out
            # ajax to return file to be defult remove
            @rental.images.create(pic: pic, default: true)
          }
        end


        format.html { redirect_to @rental, notice: 'Rental was successfully created.' }
        format.json { render :show, status: :created, location: @rental }
      else
        format.html { render :new }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end




  # PATCH/PUT /rentals/1
  # PATCH/PUT /rentals/1.json
  def update
    respond_to do |format|
      if @rental.update(rental_params)

        if params[:pics]
          params[:pics].each { |pic|
            @rental.images.create(pic: pic)
          }
        end

        format.html { redirect_to @rental, notice: 'Rental was successfully updated.' }
        format.json { render :show, status: :ok, location: @rental }
      else
        format.html { render :edit }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rentals/1
  # DELETE /rentals/1.json
  def destroy
    @rental.destroy
    respond_to do |format|
      format.html { redirect_to rentals_url, notice: 'Rental was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental
      @rental = Rental.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rental_params
      params.require(:rental).permit(:rental_listing, :addr_street_name,:phone_number, :addr_street_num, :addr_zip, :addr_city, :addr_state, :dets_company_owned, :dets_description, :description, :pics)
    end
end
