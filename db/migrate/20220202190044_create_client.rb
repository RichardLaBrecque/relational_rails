class CreateClient < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.boolean :recent_visit
      t.integer :required_visits_per_year

      t.timestamps
    end
  end
end
