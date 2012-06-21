class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :current_user_client
  
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def current_user_client
    Client.find(Person.find(current_user.person_id).client_id)
  end
  
  protected
  
  def logged_in?
    unless session[:user_id]
      redirect_to root_url
    end
  end
end
