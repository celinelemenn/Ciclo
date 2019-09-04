class PreferencesController < ApplicationController

  def update
    @user = current_user
    @user_pref = Preference.find_by(user_id: @user.id)

    if @user_pref.nil?
      @user_pref = Preference.new
      @user_pref.user = @user
    end

    @user_pref.camping = params[:camping] == 'on'
    @user_pref.caution = params[:caution] == 'on'
    @user_pref.landmark = params[:landmark] == 'on'
    @user_pref.water_refill = params[:water_refill] == 'on'

    @user_pref.save
    redirect_to map_path

  end

  def edit
    @user = User.find(params[:id])
    if @user.preferences.empty?
      @user_pref = Preference.new
      @user_pref.save
    else
      @user_pref = Preference.find_by(user_id: @user.id)
    end

    @camping_icon = POINT_OF_INTEREST[:camping][:marker_icon]
    @caution_icon = POINT_OF_INTEREST[:caution][:marker_icon]
    @landmark_icon = POINT_OF_INTEREST[:landmark][:marker_icon]
    @water_icon = POINT_OF_INTEREST[:water_refill][:marker_icon]
  end

  def preferences_params
    params.require(:preference).permit(:camping)
  end
end
