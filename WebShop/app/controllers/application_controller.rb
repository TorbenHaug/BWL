# coding: UTF-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper
  include ApplicationHelper

  def create_tests
    test
    flash[:notice] = "Test Daten erstellt"
    redirect_to :home
  end
end
