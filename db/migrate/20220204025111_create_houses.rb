class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :family_name
      t.boolean :hos_member
      t.integer :parking_spaces
      t.timestamps
    end
  end
end
