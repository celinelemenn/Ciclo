class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def map
    @point_of_interests = PointOfInterest.all

    @markers = @point_of_interests.map do |poi|
      {
        lat: poi.lat,
        lng: poi.long,
        poi_type: poi.poi_type
      }
    end
  end

  def userprofile
    @user = User.find(params[:id])
    @trips = Trip.where(user: @user)
  end
end
