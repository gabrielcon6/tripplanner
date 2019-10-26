class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /activities
  # GET /activities.json
  def index
    @logged_in_user = User.find_by :id => session[:user_id]
    @@this_trip = Trip.find params[:id]
    @this_trip = @@this_trip
    @activities = @@this_trip.activities
  end

  def start_time
    @this_trip.start_date
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
  end

  def new
    # GET ROUTE - returns /activities/new.html.erb
    # @logged_in_user = User.find_by :id => session[:user_id]
  end

  # GET /activities/new
  def new_submit

    # POST submition function for the form on
    # /activities/new.html.erb
    # should then redirect back to XXX

    puts "AAAARRRRRGGGGGHHHH+================+!!!!!!!!!!!!!!"
    puts params[:start_date].inspect
    puts "AAAARRRRRGGGGGHHHH+================+!!!!!!!!!!!!!!"
    @activities = @@this_trip.activities
    @this_trip_id = 42
    @activity = Activity.new
    @activity.title = params[:title]
    @activity.time = params[:time]
    @activity.description = params[:description]
    @activity.start_date = params[:start_date]
    @activity.end_date = params[:end_date]
    @activity.trip_id = @@this_trip.id
    @activity.save
    redirect_to "/index/#{@@this_trip_id}"
  end



  # GET /activities/1/edit
  def edit
  end

  def create_trip
    @logged_in_user = User.find_by :id => session[:user_id]
    trip = Trip.new
    trip.destination = params[:destination]
    trip.start_date = params[:start_date]
    trip.num_of_days = params[:num_of_days]
    trip.user_id = @logged_in_user.id
    trip.save
    # @logged_in_user = user.id
    redirect_to "/home"
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

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:title, :time, :description, :start_date, :end_date, :trip_id)
    end
end
