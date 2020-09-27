class RemoveUniqNameSucursal < ActiveRecord::Migration[6.0]
  def change
  	change_column :sucursales, :nombre, :string, unique: false
  end
end
