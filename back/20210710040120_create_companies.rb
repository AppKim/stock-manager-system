class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies, id: false do |t|
      t.integer :co_id, primary_key: true
      t.string :co_name, null: false, comment: '会社名'
      t.string :co_address, null: false, comment: '会社住所'
      t.string :co_profile_img, comment: '会社ロゴイメージ'
    end
  end
end
