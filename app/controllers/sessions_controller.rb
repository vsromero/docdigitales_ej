class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to :controller => 'home'
    end
  end

  def create
    @user = Usuario.find_by(email: params[:email])
    respond_to do |format|    
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        format.html { redirect_to home_index_path }
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
