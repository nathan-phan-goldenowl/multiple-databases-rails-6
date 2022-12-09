class Category < ApplicationRecord
  has_many :products

  def self.manually_switch_example
    ActiveRecord::Base.connected_to(role: :reading) do
      Category.create!(name: Faker::Commerce.material)
    end
  end
end
