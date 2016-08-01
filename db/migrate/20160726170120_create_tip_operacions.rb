class CreateTipOperacions < ActiveRecord::Migration
  def change
    create_table :tip_operacions do |t|
      t.string :nom_opera
      t.string :abrev_opera
      t.string :tipo_opera
      t.string :contable

      t.timestamps null: false
    end
  end
end
