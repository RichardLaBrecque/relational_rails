class NeighborhoodHousesController < ApplicationController

  def index
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
    if params[:sort] == "name"
      @neighborhood_houses = @neighborhood.houses.order(:family_name)
    elsif
      if params[:limit] != nil
        @neighborhood_houses = @neighborhood.houses.where ("parking_spaces > #{params[:limit]}")
    else
      @neighborhood_houses = @neighborhood.houses
    end
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
