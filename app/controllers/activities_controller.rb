class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /activities
  # GET /activities.json
  def index
    @logged_in_user = User.find_by :id => session[:user_id]
    @this_trip = Trip.find params[:id]
    @activities = @this_trip.activities
    # redirect_to "/index/#{@this_trip.id}?start_date=#{@this_trip.start_date}" 
  end

  def start_time
    @this_trip.start_date
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @activity = Activity.new
    # @logged_in_user = User.find_by :id => session[:user_id]
    # @this_trip = Trip.find params[:id]
    # @activity.save
    # @activity.title = params[:destination]
    # @activity.description = params[:description]
    # @activity.start_date = params[:start_date]
    # @activity.end_date = params[:end_date]
    @this_trip_id = params[:trip_id]
    @activity.trip_id = @this_trip_id
    @activity.save
    # @logged_in_user = user.id
    # redirect_to "/index"
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
  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
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
      params.require(:activity).permit(:title, :description, :start_date, :end_date)
    end
end
