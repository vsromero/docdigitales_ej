class SucursalesController < ApplicationController
  before_action :set_sucursal, only: [:show, :edit, :update, :destroy]

  # GET /sucursales
  # GET /sucursales.json
  def index
    @sucursales = Sucursal.all
  end

  # GET /sucursales/1
  # GET /sucursales/1.json
  def show
  end

  # GET /sucursales/new
  def new
    @sucursal = Sucursal.new
  end

  # GET /sucursales/1/edit
  def edit
    @empleados = Empleado.where(sucursal: params[:id])
  end

  # POST /sucursales
  # POST /sucursales.json
  def create
    @sucursal = Sucursal.new(sucursal_params)
    @sucursal.usuario = current_user

    respond_to do |format|
      if @sucursal.save
        #format.html { redirect_to @sucursal, notice: 'Sucursal was successfully created.' }
        format.html { 
          flash[:notice] = 'Sucursal creada!' 
          redirect_to :controller => 'home'          
        }
        format.json { render :show, status: :created, location: @sucursal }
      else
        format.html { render :new }
        format.json { render json: @sucursal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sucursales/1
  # PATCH/PUT /sucursales/1.json
  def update
    respond_to do |format|
      if @sucursal.update(sucursal_params)
        #format.html { redirect_to @sucursal, notice: 'Sucursal was successfully updated.' }
        format.html { 
          flash[:notice] = 'Sucursal editada!' 
          redirect_to :controller => 'home'          
        }
        format.json { render :show, status: :ok, location: @sucursal }
      else
        format.html { render :edit }
        format.json { render json: @sucursal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sucursales/1
  # DELETE /sucursales/1.json
  def destroy
    @sucursal.destroy
    respond_to do |format|
      #format.html { redirect_to sucursales_url, notice: 'Sucursal was successfully destroyed.' }
      format.html { 
          flash[:notice] = 'Sucursal eliminada!' 
          redirect_to :controller => 'home'          
        }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sucursal
      @sucursal = Sucursal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sucursal_params
      params.require(:sucursal).permit(:nombre, :calle, :colonia, :numero_exterior, :numero_interior, :codigo_postal, :ciudad, :pais, :usuario_id)
    end
end
