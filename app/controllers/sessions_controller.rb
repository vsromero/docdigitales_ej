class SessionsController < ApplicationController
  def new
    @errores
  end

  def create
  	user = Usuario.find_by_email(params[:email])
    respond_to do |format|    
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        format.html { redirect_to :controller => 'home' }
      else
        format.js
        format.html { render :new }
      end
    end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url
  end
end
