class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.integer :ca_id, null: false
      t.string :ca_name, null: false
    end
  end
end
