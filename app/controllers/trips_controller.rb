class TripsController < ApplicationController
  def new
    @trip = Trip.new
    @cyling_routes = [
      'EuroVelo1', 'EuroVelo2', 'EuroVelo3', 'EuroVelo4', 'EuroVelo5', 'EuroVelo6',
      'EuroVelo7', 'EuroVelo8', 'EuroVelo9', 'EuroVelo10', 'EuroVelo11', 'EuroVelo12',
      'EuroVelo15', 'EuroVelo17', 'EuroVelo19',
      'Silk Road', 'South East Asia', 'South America West Coast', 'US Pacific Coast', 'US East to West'
    ]
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
    @trip.photo = trip_params['photo']
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
    params.require(:trip).permit(:start_date, :end_date, :name, :km, :blog, :photo, :photo_cache)
  end
end
