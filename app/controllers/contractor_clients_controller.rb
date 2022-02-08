class ContractorClientsController < ApplicationController
  def index
    #binding.pry
    @contractor = Contractor.find(params[:id])
    @clients = @contractor.clients
  end
end
