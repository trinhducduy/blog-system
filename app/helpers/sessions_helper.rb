module SessionsHelper
  
  def log_in user
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
  end

  def current_user
    if user = session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
    end
  end

  def user_signed_in?
    !current_user.nil?
  end

  def authenticate_user!
    unless user_signed_in?
      redirect_to login_path
    end
  end

end
