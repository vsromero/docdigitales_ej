# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_26_212330) do

  create_table "empleados", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "nombres"
    t.string "apellidos"
    t.string "RFC"
    t.string "puesto"
    t.bigint "sucursal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sucursal_id"], name: "index_empleados_on_sucursal_id"
  end

  create_table "sucursales", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "nombre", null: false
    t.string "calle"
    t.string "colonia"
    t.integer "numero_exterior"
    t.integer "numero_interior"
    t.integer "codigo_postal"
    t.string "ciudad"
    t.string "pais"
    t.bigint "usuario_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["usuario_id"], name: "index_sucursales_on_usuario_id"
  end

  create_table "usuarios", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "nombres"
    t.string "apellidos"
    t.string "email"
    t.string "RFC"
    t.string "empresa"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "empleados", "sucursales"
  add_foreign_key "sucursales", "usuarios"
end
