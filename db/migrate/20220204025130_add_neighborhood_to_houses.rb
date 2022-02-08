class AddNeighborhoodToHouses < ActiveRecord::Migration[5.2]
  def change
    add_reference :houses, :neighborhood, foreign_key: true
  end
end
