class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.decimal :opening_cash, precision: 12, scale: 2
      t.decimal :opening_bank, precision: 12, scale: 2
      t.integer :user_id
      t.string :bank

      t.timestamps
    end
  end
end
