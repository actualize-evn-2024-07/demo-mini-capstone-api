json.products do
  json.array! @products, partial: "products/product", as: :product
end
json.suppliers do
  json.array! @suppliers, partial: "suppliers/supplier", as: :supplier 
end

