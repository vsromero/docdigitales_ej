class CreateUsuarios < ActiveRecord::Migration[6.0]
  def change
    create_table :usuarios do |t|
      t.string :nombres
      t.string :apellidos
      t.string :email
      t.string :RFC
      t.string :empresa
      t.string :password_digest

      t.timestamps
    end
  end
end
