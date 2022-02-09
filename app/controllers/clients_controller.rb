class ClientsController < ApplicationController
  def index
    @clients = Client.all
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
        binding.pry

        client.save
        redirect_to '/contractors'
  end
end
