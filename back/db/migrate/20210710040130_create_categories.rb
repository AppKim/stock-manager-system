class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories, id: false do |t|
      t.integer :ca_id, primary_key: true
      t.string :ca_name, limit: 50, null: false
    end
  end
end
