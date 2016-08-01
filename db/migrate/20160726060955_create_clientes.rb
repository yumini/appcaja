class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nombre
      t.string :apepat
      t.string :apemat
      t.string :tipdoc
      t.string :numdoc
      t.string :direccion
      t.datetime :fecnac
      t.string :tfno
      t.string :celular

      t.timestamps null: false
    end
  end
end
