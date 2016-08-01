class CreateCuentas < ActiveRecord::Migration
  def change
    create_table :cuentas do |t|
      t.string :numero_cta
      t.references :cliente, index: true, foreign_key: true
      t.references :moneda, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
