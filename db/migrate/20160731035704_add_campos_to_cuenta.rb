class AddCamposToCuenta < ActiveRecord::Migration
  def change
    add_column :cuentas, :saldo, :decimal
  end
end
