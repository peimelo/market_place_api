Placement.delete_all
Order.delete_all
Product.delete_all
User.delete_all

3.times do
  user = User.create! email: Faker::Internet.email, password: "pass12345"
  puts "Created a new user: #{user.email}"

  50.times do
    product = Product.create!(
      title: Faker::Commerce.product_name, price: rand(1.0..100.0),
      published: true,
      user_id: user.id,
      quantity: 5,
    )
    puts "Created a brand new product: #{product.title}"
  end
end
