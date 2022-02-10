class ContractorClientsController < ApplicationController
  def index
    #binding.pry
    @contractor = Contractor.find(params[:id])
    if params[:sort] == "name"
      @clients = @contractor.clients.order(:name)
      #binding.pry
    elsif params[:limit] != nil
      @clients = @contractor.clients.where("required_visits_per_year > #{params[:limit]}")
    else
      @clients = @contractor.clients
    end
  end

  def new
    @contractor = Contractor.find(params[:id])
  end

  def create
    contractor = Contractor.find(params[:contractor_id])
    client = contractor.clients.new({name: params[:name],
                            recent_visit: params[:recent_visit],
                            required_visits_per_year: params[:required_visits_per_year],
                            })

    #binding.pry
    client.save
    redirect_to "/contractors/#{contractor.id}/clients"
  end



end
