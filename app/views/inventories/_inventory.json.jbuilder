json.extract! inventory, :id, :price, :user_id, :item_id, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
