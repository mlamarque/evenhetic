class SessionsController < ApplicationController

  before_action :set_user, only: [:create]
  before_action :require_login, only: [:destroy]

  def new
    flash.clear
  end

  def create
    if @current_user
      redirect_back_or_to(root_url, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => t("controller.sessions.destroy.logged_out")
  end
  
  private

    def set_user
      @current_user = login(params[:user][:email], params[:user][:password])
    end

end