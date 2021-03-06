class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  before_action :authorize_user

  # GET /activities
  def index
    @logged_in_user = User.find_by :id => session[:user_id]
    @this_trip = Trip.find params[:id]
    @@this_trip = @this_trip
    @activities = @this_trip.activities.sort_by &:time
  end

  def show_activity
    @this_trip = Trip.find_by :id => params[:trip_id]
    @this_activity = Activity.find_by :id => params[:activity_id]
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
  end

  def new
    # GET ROUTE - returns /activities/new.html.erb
    @logged_in_user = User.find_by :id => session[:user_id]
    @this_trip = Trip.find params[:id]
    @@this_trip = @this_trip
    @activities = @this_trip.activities
  end

  # GET /activities/new
  # POST submition function for the form on
  # /activities/new.html.erb
  # should then redirect back to XXX
  def new_submit
    @this_trip = Trip.find params[:trip_id]
    @activity = Activity.new
    @activity.title = params[:title]
    @activity.time = params[:time]
    @activity.description = params[:description]
    @activity.start_date = params[:start_date]
    @activity.trip_id = params[:trip_id]
    @activity.save
    redirect_to "/trip/index/#{@this_trip.id}/#{@this_trip.start_date}
                ?start_date=#{@this_trip.start_date}"
  end

  # GET /activities/1/edit
  def edit
  end

  def create_trip
    @logged_in_user = User.find_by :id => session[:user_id]
    trip = Trip.new
    trip.destination = params[:destination]
    trip.start_date = params[:start_date]
    trip.end_date = params[:end_date]
    trip.user_id = @logged_in_user.id
    trip.save
    redirect_to "/home"
  end

  def edit_trip
    @this_trip = Trip.find_by :id => params[:trip_id]
    @this_trip.destination = params[:destination]
    @this_trip.start_date = params[:start_date]
    @this_trip.end_date = params[:end_date]
    @this_trip.save
    redirect_to "/trip/index/#{@this_trip.id}/#{@this_trip.start_date}
                ?start_date=#{@this_trip.start_date}"
  end

  def destroy_trip
    @this_trip = Trip.find_by :id => params[:trip_id]
    @this_trip.destroy
    redirect_to "/home"
  end

  def edit_activity
    @this_trip = Trip.find_by :id => params[:trip_id]
    @activity = Activity.find_by :id => params[:activity_id]
    @activity.title = params[:title]
    @activity.time = params[:time]
    @activity.description = params[:description]
    @activity.start_date = params[:start_date].to_s
    @activity.save
    redirect_to "/index/activity/#{@this_trip.id}/#{@activity.id}"
  end

  def destroy_activity
    @this_trip = Trip.find_by :id => params[:trip_id]
    @activity = Activity.find_by :id => params[:activity_id]
    @activity.destroy
    redirect_to "/trip/index/#{@this_trip.id}/#{@this_trip.start_date}
    ?start_date=#{@this_trip.start_date}"
  end

  # POST /activities
  # POST /activities.json
  def create_activity
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:title, :time, :description, :start_date, :trip_id)
    end

end
