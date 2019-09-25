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


    other_cyclist = User.where.not(id: current_user.id)
    last_user_positions = []

    other_cyclist.each do |cyclist|

      if UserPosition.where(user_id: cyclist.id).exists?
        cyclist_positions = UserPosition.where(user_id: cyclist.id)
        cyclist_last_position = cyclist_positions.last
        last_user_positions << cyclist_last_position
      end
    end

    @cyclist_avatars = last_user_positions.map do |cyclist_last_pos|
      {
        id: cyclist_last_pos.user_id,
        lat: cyclist_last_pos.lat,
        lng: cyclist_last_pos.long,
        user_link: userprofile_path(cyclist_last_pos.user_id),
        infoWindow: render_to_string(partial: "info_window_cyclist", locals: { cyclist: cyclist_last_pos.user })
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

  def help
  end
end
