class NeighborhoodsController < ApplicationController

  def index
    @neighborhoods = Neighborhood.all.order(created_at: :desc)
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
  end

  def new
  end

  def edit
    @neighborhood = Neighborhood.find(params[:id])
  end

  def update
    neighborhood = Neighborhood.find(params[:id])
    neighborhood.update(neighborhood_params)
    redirect_to "/neighborhoods/#{neighborhood.id}"
  end

  def destroy

    neighborhood = Neighborhood.find(params[:id])
    neighborhood.houses.destroy_all
    neighborhood.destroy
    redirect_to "/neighborhoods"
  end

  def create
    Neighborhood.create(neighborhood_params)
    redirect_to '/neighborhoods'
  end

  private
    def neighborhood_params
      params.permit(:name, :has_pool, :number_of_streets)
    end
end
