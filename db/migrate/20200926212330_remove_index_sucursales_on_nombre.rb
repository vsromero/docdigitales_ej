class RemoveIndexSucursalesOnNombre < ActiveRecord::Migration[6.0]
  def change
  	remove_index :sucursales, name: "index_sucursales_on_nombre"
  end
end
