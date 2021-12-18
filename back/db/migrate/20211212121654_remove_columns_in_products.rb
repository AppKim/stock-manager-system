class RemoveColumnsInProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :pr_img, :string
  end
end
