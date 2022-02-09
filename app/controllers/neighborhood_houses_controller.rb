class NeighborhoodHousesController < ApplicationController
  def index
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
    @neighborhood_houses = @neighborhood.houses
  end

  def new
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
  end

  def create
    @neighborhood_id = params[:neighborhood_id]
    House.create(house_params)
    redirect_to "/neighborhoods/#{@neighborhood_id}/houses"
  end

  private
  def house_params
    params.permit(:family_name, :hos_member, :parking_spaces, :neighborhood_id)
  end

end
