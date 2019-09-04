class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def map
    @point_of_interests = PointOfInterest.published
    @user = current_user
    @user_pref = Preference.find_by(user_id: @user.id)

    if @user_pref
      @camping = @user_pref.camping ? @point_of_interests.camping : []
      @landmark = @user_pref.landmark ? @point_of_interests.landmark : []
      @water = @user_pref.water_refill ? @point_of_interests.water : []
      @caution = @user_pref.caution ? @point_of_interests.caution : []

      @point_of_interests = @camping + @landmark + @water + @caution
    end

    @markers = @point_of_interests.map do |poi|
      {
        id: poi.id,
        lat: poi.lat,
        lng: poi.long,
        poi_type: poi.poi_type,
        marker_link: POINT_OF_INTEREST[poi.poi_type.to_sym][:marker_icon],
        infoWindow: render_to_string(partial: "info_window", locals: { poi: poi })
      }
    end

    # poi.poi_type.to_sym

    @cyclists = UserPosition.where.not(user_id: current_user.id)
    @cyclist_avatars = @cyclists.map do |cyclist|
      {
        id: cyclist.user_id,
        lat: cyclist.lat,
        lng: cyclist.long,
        user_link: userprofile_path(cyclist.user_id)

      }
    end
    @point_of_interest_new = PointOfInterest.new
  end

  def profile
    @user = current_user
  end

  def feed
  end

  def userprofile
    if params[:receiver_id]
      @conversation = Conversation.find_by(recevier_id: params[:id])
    else
      @conversation = Conversation.new
      # binding.pry
    end
    @user = User.find(params[:id])
    @trips = Trip.where(user: @user)
  end
end
