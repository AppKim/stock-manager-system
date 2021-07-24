class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks, id: false do |t|
      t.integer :st_id, primary_key: true
      t.integer :st_pr_id, null: false
      t.integer :st_exist, default: 1
    end
    add_foreign_key :stocks, :products, column: :st_pr_id, primary_key: :pr_id
  end
end
