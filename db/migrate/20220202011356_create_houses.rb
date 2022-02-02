class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :name
      t.boolean :hos_member
      t.integer :parking_spaces
      t.references :neighborhood
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
