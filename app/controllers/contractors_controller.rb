class ContractorsController < ApplicationController
  def index
    @contractors = Contractor.order(created_at: :desc)
    #binding.pry
  end


  def create
  #  binding.pry
    contractor = Contractor.new({
      name: params[:name],
      licensed: params[:licensed],
      service_cost: params[:service_cost],
      service_area: params[:service_area],
      })

      contractor.save
      redirect_to '/contractors'
  end

  def show
    @contractor = Contractor.find(params[:id])
  end

  def new
  end

  def edit
    @contractor = Contractor.find(params[:id])
  end

  def update
    contractor = Contractor.find(params[:id])
    contractor.update({
      name: params[:name],
      licensed: params[:licensed],
      service_cost: params[:service_cost],
      service_area: params[:service_area],
      })
      #binding.pry

      contractor.save
      redirect_to '/contractors'

  end
end
