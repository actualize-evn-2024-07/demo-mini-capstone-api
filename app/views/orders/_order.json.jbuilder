json.id order.id
json.subtotal order.subtotal
json.tax order.tax
json.total order.total
json.created_at order.created_at
json.updated_at order.updated_at
json.carted_products order.carted_products.each do |cp|
  json.id cp.id
  json.quantity cp.quantity
  json.product cp.product
end