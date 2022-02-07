class NeighborhoodHousesController < ApplicationController
  def index
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
    @neighborhood_houses = @neighborhood.houses
  end

end
