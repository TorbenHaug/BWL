class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      if session[:not_insert_shopping_card_entry].nil?
        redirect_to ((session[:return_to].nil?) ? root_path : session[:return_to])
      else
        add_to_shopping_card_helper(session[:not_insert_shopping_card_entry][0],session[:not_insert_shopping_card_entry][1])
      end
    else
      flash[:notice] = "Bei der Eingabe Ihrer E-Mail-Adresse/Ihres Kennworts ist ein Fehler aufgetreten.<br/>Bitte versuchen Sie es erneut.".html_safe
      render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
