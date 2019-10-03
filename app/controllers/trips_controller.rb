class TripsController < ApplicationController
  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save!
      redirect_to profile_path
    else
      render trips_new_path
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)

    if @trip.save
      redirect_to profile_path
    else
      render :edit
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :name, :km, :blog, :photo, :photo_cache)
  end
end
