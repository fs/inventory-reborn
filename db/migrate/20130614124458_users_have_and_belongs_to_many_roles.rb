class UsersHaveAndBelongsToManyRoles < ActiveRecord::Migration
  def change
    create_table :roles_users, id: false do |t|
      t.references :role, :user
    end

    add_index :roles_users, [:role_id, :user_id]
  end
end
