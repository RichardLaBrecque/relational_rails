class NeighborhoodsController < ApplicationController

  def index
    @neighborhoods = Neighborhood.all.order(created_at: :desc)
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
  end

  def new
  end

  def create
    Neighborhood.create!(neighborhood_params)
    redirect_to '/neighborhoods'
  end

  private
    def neighborhood_params
      params.permit(:name)
      params.permit(:has_pool)
      params.permit(:number_of_streets)
    end
end
