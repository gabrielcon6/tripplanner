class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.create user_params # strong params

    if user.persisted?
      # Account created successfully!
      session[:user_id] = user.id # Log in the new user!!
      redirect_to user_path(user) # go to the show page for this user
    else


      flash[:errors] = user.errors.full_messages
      redirect_to new_user_path
    end

  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find_by id: session[:user_id]
  end

  def update
    @user = User.find params[:id]
    @user.save

    if @user.update(user_params)
      redirect_to( user_path( @user.id ) )
    else
      flash[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
  end

  private
  # strong params, the doorman for the form fields
  def user_params
    params.require(:user).permit(:name, :email, :image, :password, :password_confirmation)
  end
end