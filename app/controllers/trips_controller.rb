class TripsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authorize_user

  def home
    @logged_in_user = User.find_by :id => session[:user_id]
  end
end
