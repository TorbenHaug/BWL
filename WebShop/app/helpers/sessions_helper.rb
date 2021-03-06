module SessionsHelper
  def check_rights(right)
    if right
      true
    else
      flash[:notice] = "Nicht genug rechte"
      redirect_to :root
      false
    end
  end
  def admin_user?
    current_user.nil? ? false : current_user.role < 1
  end
  def set_menu_id(id)
    session[:menu_id] = id.to_i
  end
  def get_menu_id
    session[:menu_id]
  end
  def log_in(user)
    session[:user_id] = user.id
  end
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end
  def logged_in?
    !current_user.nil?
  end
  def admin?
    logged_in? && current_user.admin_user?
  end
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
end
