current_time = Time.current

categories = 1000.times.map do |time|
  {
    name: "#{Faker::Commerce.material}_#{time.to_s}",
    created_at: current_time,
    updated_at: current_time,
  }
end

Category.insert_all(categories)

100.times.each do
  products = 10_000.times.map do |time|
    {
      name: "#{Faker::Commerce.product_name}_#{time.to_s}",
      quantity: Faker::Number.within(range: 0..1000),
      category_id: Faker::Number.within(range: 1..1000),
      created_at: current_time,
      updated_at: current_time,
    }
  end

  Product.insert_all(products)
end

# users = 10_000.times.map do |time|
#   {
#     name: Faker::Name.unique.name,
#     created_at: current_time,
#     updated_at: current_time,
#   }
# end

# User.insert_all(users)

100.times.each do
  likes = 10_000.times.map do |time|
    {
      product_id: Faker::Number.within(range: 1..1_000_000),
      user_id: Faker::Number.within(range: 1..10_000),
      created_at: current_time,
      updated_at: current_time,
    }
  end

  Like.insert_all(likes)
end
