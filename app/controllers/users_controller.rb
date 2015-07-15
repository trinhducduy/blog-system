class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user!, only: [:dashboard]

  def dashboard
  end

  def show
  end

  protected
  def set_user
    @user = User.find(params[:id])
  end
end
