class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions, id: false do |t|
      t.integer :se_us_id, null: false
      t.string :se_id, null: false

      add_foreign_key :users, :se_us_id, column: :us_id, primary_key: :us_id
    end
  end
end
