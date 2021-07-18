class CreateHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :histories, id: false do |t|
      t.integer :hi_co_id
      t.text :hi_comments, null: false

      add_foreign_key :histories, :companies, column: :hi_co_id, primary_key: :co_id
    end
  end
end
