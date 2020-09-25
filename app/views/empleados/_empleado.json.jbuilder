json.extract! empleado, :id, :nombres, :apellidos, :RFC, :puesto, :sucursal_id, :created_at, :updated_at
json.url empleado_url(empleado, format: :json)
