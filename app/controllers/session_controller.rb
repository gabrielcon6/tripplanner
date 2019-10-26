class SessionController < ApplicationController
  def new
    @error_message = flash[:error]
    @error_message2 = flash[:error2]
  end

  def create_user
    name = params[:name]
    password = params[:password]
    email = params[:email]
    user = User.find_by :email => email

    if user.nil?
      new = User.create(name: name.to_s, password_digest: BCrypt::Password.create(password.to_s), email: email.to_s)
      session[:user_id] = new.id
      @logged_in_user = new.id
      redirect_to '/home'
    else
      flash[:error2] = 'User already exists'
      redirect_to '/login'
    end
  end

  def create
    user = User.find_by :email => params[:email]
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      @logged_in_user = user.id
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