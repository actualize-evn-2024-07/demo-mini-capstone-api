# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# 10.times do
#   product = Product.new(
#     name: "television#{rand(1..100)}",
#     price: 600,
#     image_url: "https://media.istockphoto.com/id/1395191574/photo/black-led-tv-television-screen-blank-isolated.jpg?s=612x612&w=0&k=20&c=ps14JZJh0ebkINcbQyHFsR1J5EC7ozkj_WO7Fh_9IOI=",
#     description: "shows images from tv channels",
#     supplier_id: Supplier.first.id

#   )
#   product.save!
# end
# 
#
#
# find all the products with an image_url
# make a new image for that product
# products_with_images = Product.where.not(image_url: nil)

# products_with_images.each do |product|
#   Image.create!(url: product.image_url, product_id: product.id)
# end