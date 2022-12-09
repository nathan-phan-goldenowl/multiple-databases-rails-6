class Product < ApplicationRecord
  belongs_to :category
  has_many :likes

  validates :name, uniqueness: true

  def self.shard_example
    ActiveRecord::Base.connected_to(role: :writing, shard: :default) do
      @product = Product.first
    end

    ActiveRecord::Base.connected_to(role: :writing, shard: :shard_one) do
      Product.create(name: @product.name, category_id: 1)
    end
  end
end
