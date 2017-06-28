json.extract! credit_purchase, :id, :stock_description, :creditor_name, :user_id, :amount, :image, :created_at, :updated_at
json.url credit_purchase_url(credit_purchase, format: :json)
