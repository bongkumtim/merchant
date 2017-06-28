class CreateCashPurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :cash_purchases do |t|
      t.string :stock_description
      t.integer :user_id
      t.json :image
      t.decimal :amount, precision: 12, scale: 2
      t.decimal :debit_purchase_cost_of_sales, precision: 12, scale: 2
      t.decimal :credit_cash_current_asset, precision: 12, scale: 2

      t.timestamps
    end
  end
end
