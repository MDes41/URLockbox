class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash['alert-success'] = "Welcome, #{user.email}"
      redirect_to :root
    else
      flash.now['alert-danger'] = user.errors.full_messages.join(', ')
      redirect_to :login
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :login
  end
end
