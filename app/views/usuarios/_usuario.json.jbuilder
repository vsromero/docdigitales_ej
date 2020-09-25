json.extract! usuario, :id, :nombres, :apellidos, :email, :RFC, :empresa, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
