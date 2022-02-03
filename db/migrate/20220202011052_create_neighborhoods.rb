class CreateNeighborhoods < ActiveRecord::Migration[5.2]
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.boolean :has_pool
      t.integer :number_of_streets
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
