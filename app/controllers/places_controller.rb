class PlacesController < ApplicationController
	def index
		@places= Place.all
	end
	def show
		@place= Place.find(params[:id])
	end

	def new
		if not current_user
      flash[:notice] = "Please login to create a new place"
      redirect_to :places
      return
    else
      @place = Place.new
    end
	end

	def create
		Place.create(place_params)
  	redirect_to :places
	end

	def destroy
  	place = Place.find(params[:id])
  	place.destroy
  	redirect_to :places
	end

	def edit
  	@place = Place.find(params[:id])
	end
	def update
    place = Place.find(params[:id])
    place.update_attributes(place_params)
    redirect_to place_path(params[:id])
  end

	private
  	def place_params
   		params.require(:place).permit(:name, :owner, :address, :capacity, :description)
  	end

end
