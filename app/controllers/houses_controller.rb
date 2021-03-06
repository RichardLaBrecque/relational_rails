class HousesController < ApplicationController
  def index
    @houses = House.where(hos_member: 'true')
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
    house = House.find(params[:id])
    house.update(house_params)
    redirect_to "/houses/#{house.id}"
  end

  def destroy
    house = House.find(params[:id])
    house.destroy
    redirect_to "/houses"
  end

  private
    def house_params
      params.permit(:family_name, :hos_member, :parking_spaces, :neighborhood_id)
    end

end
