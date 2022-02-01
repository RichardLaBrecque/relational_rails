class ContractorsController < ApplicationController
  def index
    @contractors = Contractor.all
  end

  def new
  end

  def create
    contractor = Contractor.new({
      name: params[:contractor][:name],
      licensed: params[:contractor][:licensed],
      service_cost: params[:contractor][:service_cost],
      service_area: params[:contractor][:service_area],
      created_at: params[:contractor][:created_at],
      updated_at: params[:contractor][:updated_at]
      })

      contractor.save
      redirect_to '/contractors'
  end
end
