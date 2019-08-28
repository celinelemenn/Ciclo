class TripsController < ApplicationController
  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      redirect_to profile_path
    else
      render 'trips/new'
    end
  end

  private

  def trip_params
    params.permit(:start_date, :end_date, :name, :km, :blog)
  end
end
