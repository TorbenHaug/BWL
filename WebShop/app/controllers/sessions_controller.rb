class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:notice] = "Wilkommen " + user.firstname + " " + user.lastname
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to ((session[:return_to].nil?) ? root_path : session[:return_to])
    else
      flash[:notice] = "Emailadresse oder Passwort ist falsch!"
      render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
