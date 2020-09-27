class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    if logged_in?
      redirect_to :controller => 'home'
    end
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)

    respond_to do |format|
      if @usuario.save
        #format.html { redirect_to @usuario, notice: 'Usuario was successfully created.' }
        format.html { 
          flash[:notice] = 'Cuenta creada!' 
          redirect_to root_url         
        }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def checkEmail
    @email = params[:usuario]['email'] # Saca email del objeto mandado
    @usuario = Usuario.find_by email: @email
    respond_to do |format|
      # Si usuario es blank regresa true
      format.json { render :json => @usuario.blank? }
    end
  end

  def checkRFC
    @RFC = params[params.keys()[0]]['RFC'] # Saca RFC del objeto mandado
    @usuario = Usuario.find_by RFC: @RFC
    @empleado = Empleado.find_by RFC: @RFC
    respond_to do |format|
      # Regresa si usuario o empleado existe
      # Si usuario Y empleado son nil regresa true
      format.json { render :json => @usuario.blank? && @empleado.blank? }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def usuario_params
      params.require(:usuario).permit(:nombres, :apellidos, :email, :RFC, :empresa, :password, :password_confirmation)
    end
end
