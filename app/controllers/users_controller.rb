class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user!, only: [:dashboard]

  def dashboard
    @feed = current_user.feed.paginate(page: params[:page], per_page: 10)
  end

  def show
    @entries = @user.entries
  end

  protected
  def set_user
    @user = User.find(params[:id])
  end
end
