class HousesController < ApplicationController
  def index
    @houses = House.all
  end

  def new
  end

  def show
    @house = House.find(params[:id])
  end

  def edit
    @house = House.find(params[:id])
  end

  def create
    Neighborhood.create(neighborhood_params)
    redirect_to '/houses'
  end

  def update
    # require "pry"; binding.pry
    house = House.find(params[:id])
    house.update(house_params)
    redirect_to "/houses/#{house.id}"
  end

  private
    def house_params
      params.permit(:family_name, :hos_member, :parking_spaces, :neighborhood_id)
    end

end
