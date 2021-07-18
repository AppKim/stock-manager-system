class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands, id:false do |t|
      t.integer :br_id, primary_key: true
      t.string :br_name, null:false, comment: 'ブランド名'
    end
  end
end
