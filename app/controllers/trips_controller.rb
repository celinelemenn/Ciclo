class TripsController < ApplicationController
  def index
    @badge_poi_unpublished = PointOfInterest.select { |poi| poi.user == current_user && poi.published == false }.count
    search_params

    if params[:query].nil? || params[:query].empty?
      @trips = Trip.approved.not_deleted.order(start_date: :desc)
    else
      @params = params[:query]
      @trips = Trip.approved.not_deleted.order(start_date: :desc).where("name @@ ?", "%#{@params}%")
    end

    @cycling_routes = Trip::CYCLING_ROUTES
    @trips_noroute = Trip.where(cycling_route: nil).approved.not_deleted.or(Trip.where(cycling_route: "").approved.not_deleted).order(start_date: :desc)
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    @trip.photo = trip_params['photo'] unless trip_params['photo'].nil?
    if @trip.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:id])
    if @trip.soft_deleted == true
      redirect_to trips_path
    end
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
    if @trip.soft_deleted == true
      redirect_to trips_path
    end
  end



  def destroy
    @trip = Trip.find(params[:id])
    @trip.soft_deleted = true
    @trip.save
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
