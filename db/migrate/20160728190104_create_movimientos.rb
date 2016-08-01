class CreateMovimientos < ActiveRecord::Migration
  def change
    create_table :movimientos do |t|
      t.decimal :monto
      t.datetime :feha
      t.references :cuenta, index: true, foreign_key: true
      t.references :tipoperacion, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
