class User < ApplicationRecord
  has_many :likes
  has_many :liked_products, through: :likes, source: :product
end
