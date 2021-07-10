class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles, id: false do |t|
    end
  end
end
