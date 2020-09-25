class CreateSucursales < ActiveRecord::Migration[6.0]
  def change
    create_table :sucursales do |t|
      t.string :nombre, null: false
      t.string :calle
      t.string :colonia
      t.integer :numero_exterior
      t.integer :numero_interior
      t.integer :codigo_postal
      t.string :ciudad
      t.string :pais
      t.belongs_to :usuario, null: false, foreign_key: true

      t.timestamps
    end
    add_index :sucursales, :nombre, unique: true
  end
end
