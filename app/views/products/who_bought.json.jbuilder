
json.extract! @product, :id, :title, :price
json.orders @product.orders do |product|
  json.name product.name
  json.address product.address
  json.email product.email
end