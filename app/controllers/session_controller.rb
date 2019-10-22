class SessionController < ApplicationController
  def new
    @error_message = flash[:error]
  end

  def create
    user = User.find_by :email => params[:email]
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/home'
    else
      flash[:error] = 'Invalid credentials'
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
