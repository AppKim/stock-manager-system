class AddTimestampsToProducts < ActiveRecord::Migration[6.0]
  def change
    add_timestamps :products, null: false
  end
end
