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
  
  def test_area_1
    render template: 'static_pages/test_area_1'
  end
  
  def test_area_2
    render template: 'static_pages/test_area_2'
  end
  
  def legal_information
    render template: 'static_pages/legal_information'
  end
  
  def disclaimer
    render template: 'static_pages/disclaimer'
  end
  
  def privacy_policy
    render template: 'static_pages/privacy_policy'
  end
end
