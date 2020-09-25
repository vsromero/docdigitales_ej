class CreateEmpleados < ActiveRecord::Migration[6.0]
  def change
    create_table :empleados do |t|
      t.string :nombres
      t.string :apellidos
      t.string :RFC
      t.string :puesto
      t.belongs_to :sucursal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
