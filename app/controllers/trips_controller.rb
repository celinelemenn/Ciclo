class TripsController < ApplicationController

  before_action :set_cycling_route_array , only: [:edit, :update, :new, :create]


  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    @trip.photo = trip_params['photo'] unless trip_params['photo'].nil?
    # raise
    if @trip.save
      redirect_to profile_path
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.delete
    redirect_to profile_path
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :name, :km, :blog, :photo, :photo_cache, :country_code, :cyling_routes)
  end

  def set_cycling_route_array
    @cycling_routes = CYCLING_ROUTES
  end
end
