class RemoveFehadeMigrationFromMovimientos < ActiveRecord::Migration
  def change
    remove_column :movimientos, :feha, :datetime
  end
end
