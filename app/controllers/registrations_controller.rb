class RegistrationsController < ApplicationController
  before_action :set_user, only: [:edit]

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "You have been successfully registered"
      redirect_to root_path
    else
      render :new
    end
  end

  protected
  def set_user
    @user = User.find(param[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, 
      :password_confirmation)
  end
end
