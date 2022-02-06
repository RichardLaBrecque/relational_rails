class NeighborhoodsController < ApplicationController
  def index
    @neighborhoods = Neighborhood.all.order(created_at::desc)
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
  end
end
# Song.select(:title).where('play_count >= ?', 3000).order(length: :desc).limit(2)
