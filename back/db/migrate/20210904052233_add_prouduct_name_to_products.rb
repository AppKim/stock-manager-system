class AddProuductNameToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :pr_name, :string
  end
end
