class CreateMonedas < ActiveRecord::Migration
  def change
    create_table :monedas do |t|
      t.string :nom_moneda
      t.string :simb_moneda
      t.string :abrev_moneda

      t.timestamps null: false
    end
  end
end
