json.extract! item, :id, :name, :stock, :price, :user_id, :created_at, :updated_at
json.url item_url(item, format: :json)
