class AddExpirationToStocks < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :st_expiration, :datetime
  end
end
