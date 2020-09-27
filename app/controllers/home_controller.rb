class HomeController < ApplicationController
  def index
  	@sucursales = Sucursal.where(usuario: current_user)
  end

  def admin
  	@usuarios = Usuario.all
  	@sucursales = Sucursal.all
  	@empleados = Empleado.all
  end
end
