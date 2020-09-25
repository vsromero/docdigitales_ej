class HomeController < ApplicationController
  def index
  	@sucursales = Sucursal.where(usuario: current_user)
  end
end
