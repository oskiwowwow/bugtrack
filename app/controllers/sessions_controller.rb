class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to calls_url
    else
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
