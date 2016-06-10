class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user # logs in new user automatically, method defined in SessionsHelper
      flash[:success] = "Welcome, your account has been created."
      redirect_to @user
    else
      flash.now[:danger] = "Your account has not been created."
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
