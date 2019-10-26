class TripsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def home
    @logged_in_user = User.find_by :id => session[:user_id]
    # @trips = @logged_in_user.trips
    # @activities = @trips.activities
  end
end
