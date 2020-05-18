class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home terms sitemap contact]
  before_action :badge, only: %i[map feed profile]

  def home
  end

  def map
    @point_of_interests = PointOfInterest.published
    @user = current_user
    @user_last_position = @user.user_positions.exists? ? [{ lat: @user.user_positions.last.lat, long: @user.user_positions.last.long }] : nil
    @user_pref = Preference.find_by(user_id: @user.id)

    if @user_pref
      @camping = @user_pref.camping ? @point_of_interests.camping : []
      @landmark = @user_pref.landmark ? @point_of_interests.landmark : []
      @water = @user_pref.water_refill ? @point_of_interests.water : []
      @caution = @user_pref.caution ? @point_of_interests.caution : []
      @toilet = @user_pref.toilet ? @point_of_interests.toilet : []
      @wild_camping = @user_pref.wild_camping ? @point_of_interests.wild_camping : []
      @hotel = @user_pref.hotel ? @point_of_interests.hotel : []
      @bar = @user_pref.bar ? @point_of_interests.bar : []
      @shopping = @user_pref.shopping ? @point_of_interests.shopping : []
      @wifi = @user_pref.wifi ? @point_of_interests.wifi : []
      @picnic = @user_pref.picnic ? @point_of_interests.picnic : []
      @repair = @user_pref.repair ? @point_of_interests.repair : []
      @info = @user_pref.info_point ? @point_of_interests.info_point : []
      @elect = @user_pref.electricity ? @point_of_interests.electricity : []
      @resto = @user_pref.resto ? @point_of_interests.resto : []

      @point_of_interests = @camping + @landmark + @water + @caution + @toilet + @wild_camping + @hotel + @bar + @shopping + @wifi + @picnic + @repair + @info + @elect + @resto
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
    @pop_up_html = render_to_string(partial: "info_window_add_poi")

    other_cyclist = User.where.not(id: current_user.id)
    last_user_positions = []

    other_cyclist.each do |cyclist|
      next unless UserPosition.where(user_id: cyclist.id).exists?

      cyclist_positions = UserPosition.where(user_id: cyclist.id)
      cyclist_last_position = cyclist_positions.last
      last_user_positions << cyclist_last_position
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
    @trips = @user.trips.sort_by(&:start_date).reverse!
  end

  def feed
    @user = current_user

    if params[:feed_type] == "all"

      @user_poi_published = PointOfInterest.order(created_at: :desc).select { |poi| poi.published == true }
      @user_poi_unpublished = []
    else
      @user_poi = PointOfInterest.order(created_at: :desc)
      @user_poi_unpublished = @user_poi.select { |poi| poi.user == current_user && poi.published == false }
      @user_poi_published = @user_poi.select { |poi| poi.user == current_user && poi.published == true }

    end
  end

  def userprofile
    # this is the cycling profile (not user profile)
    if params[:receiver_id]
      @conversation = Conversation.find_by(recevier_id: params[:id])
    else
      @conversation = Conversation.new
      # binding.pry
    end
    @user = User.find(params[:id])
    @trips = Trip.where(user: @user).sort_by(&:start_date).reverse!
  end

  def help
  end

  def terms
  end

  def contact
    @user = User.find_by(admin: true)
    if params[:receiver_id]
      @conversation = Conversation.find_by(recevier_id: params[:id])
    else
      @conversation = Conversation.new
    end
    @feedback = Feedback.new
  end

  def welcomehome
  end

  def welcomeprofile
  end

  def welcomeinspire
  end

  def welcomeplan
  end

  def badge
    @badge_poi_unpublished = PointOfInterest.select { |poi| poi.user == current_user && poi.published == false }.count
  end

  def sitemap
  end
end
