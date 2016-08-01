class AddNewValuesToMovimientos < ActiveRecord::Migration
  def change
    add_column :movimientos, :fecha, :datetime
  end
end
