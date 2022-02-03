class AddContractorToClients < ActiveRecord::Migration[5.2]
  def change
    add_reference :clients, :contractor, foreign_key: true
  end
end
