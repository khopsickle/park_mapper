class UsersController < ApplicationController

  before_action :find_user, only: [:show]
  before_action :signed_in_redirect, only: [:create, :new]
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      flash[:success] = "Account created."
      redirect_to @user
    else
      flash[:danger] = @user.errors.full_messages
      render :new
    end
  end

  def show

  end

  private

    def user_params
      params.require(:user).permit(:email, :first_name, :password, :password_confirmation )
    end

    def find_user
      @user = User.find_by_id(params[:id])
    end
end
