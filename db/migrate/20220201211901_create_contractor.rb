class CreateContractor < ActiveRecord::Migration[5.2]
  def change
    create_table :contractors do |t|
      t.string :name
      t.boolean :licensed
      t.integer :service_cost
      t.integer :service_area

      t.timestamps
    end
  end
end
