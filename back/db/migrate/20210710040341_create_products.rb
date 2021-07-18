class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products, id: false do |t|
      t.integer :pr_id, primary_key: true
      t.references :pr_ca_id, null: false
      t.references :pr_br_id, null: false
      t.references :pr_us_id, null: false
      t.string :pr_price, limit: 50, null: true
      t.string :pr_barcode, limit: 255, null: true
      t.string :pr_img, limit: 255, null: true
      t.datetime :pr_expiration, null: false 

      add_foreign_key :categories, :pr_ca_id, column: :ca_id, primary_key: :ca_id
      add_foreign_key :brands, :pr_br_id, column: :br_id, primary_key: :br_id
      add_foreign_key :user, :pr_us_id, column: :us_id, primary_key: :us_id
    end
  end
end
