class Client < ApplicationRecord
  belongs_to :contractor

  def self.is_true
    binding.pry
  end
end
