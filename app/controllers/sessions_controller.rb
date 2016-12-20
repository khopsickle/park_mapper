class SessionsController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      flash[:success] = "Signed In"
      redirect_to @user
    else
      flash[:error] = "Invalid email or password."
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = "Signed out."
    redirect_to root_url
  end
end
