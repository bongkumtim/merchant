class AddImageToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :image, :json
  end
end
