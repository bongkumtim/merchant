class CreateCreditPurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_purchases do |t|
      t.string :stock_description
      t.string :creditor_name
      t.integer :user_id
      t.decimal :amount, precision: 12, scale: 2
      t.json :image

      t.timestamps
    end
  end
end
