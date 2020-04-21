class TripsController < ApplicationController
  def index
    @badge_poi_unpublished = PointOfInterest.select { |poi| poi.user == current_user && poi.published == false }.count
    search_params

    if params[:query].nil? || params[:query].empty?
      @trips = Trip.where(moderation: true).order(start_date: :desc)
    else
      @params = params[:query]
      @trips = Trip.order(start_date: :desc).where("name @@ ?", "%#{@params}%")
    end

    @cycling_routes = Trip::CYCLING_ROUTES
    @trips_noroute = Trip.where(cycling_route: nil).or(Trip.where(cycling_route: "")).where(moderation: true).order(start_date: :desc)
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    @trip.moderation = true
    @trip.photo = trip_params['photo'] unless trip_params['photo'].nil?
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

    if @trip.save
      redirect_to profile_path
    else
      render :edit
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.delete
    redirect_to profile_path
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :name, :km, :blog, :photo, :photo_cache, :country_code, :cycling_route, :description)
  end

  def search_params
    params.permit(:query)
  end
end
