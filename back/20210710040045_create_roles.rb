class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles, id: false do |t|
      t.integer :ro_id, primary_key: true
      t.string :ro_name, null: false, comment: 'ロール名'
    end
  end
end
