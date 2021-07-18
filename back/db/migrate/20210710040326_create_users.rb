class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: false do |t|
      t.integer :us_id, primary_key: true
      t.reference :us_ro_id, null: false
      t.reference :us_co_id, null: false
      t.string :us_login_id, unique: true, limit: 50, null: false
      t.string :us_login_pw, limit: 50, limit: 255, null: false

      add_foreign_key :roles, :us_ro_id, column: :ro_id, primary_key: :ro_id
      add_foreign_key :companies, :us_co_id, column: :co_id, primary_key: :co_id
    end
  end
end
