class ClientsController < ApplicationController
  def index
    @clients = Client.where("recent_visit = True")
    #binding.pry
  end

  def show
    @client = Client.find(params[:id])
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
      client = Client.find(params[:id])
      client.update({
        name: params[:name],
        recent_visit: params[:recent_visit],
        required_visits_per_year: params[:required_visits_per_year],
        })

        client.save
        redirect_to '/clients'
  end
end
