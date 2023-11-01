json.extract! customer, :id, :day, :time, :cuisine, :meal, :price, :cheff_id, :created_at, :updated_at
json.url customer_url(customer, format: :json)
