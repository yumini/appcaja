class AddCamposToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :matricula, :string
    add_column :admin_users, :nombre, :string
    add_column :admin_users, :apepat, :string
    add_column :admin_users, :apemat, :string
    add_column :admin_users, :role, :string
  end
end
