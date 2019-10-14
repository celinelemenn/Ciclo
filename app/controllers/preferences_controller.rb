class PreferencesController < ApplicationController

  def update
    @user = current_user
    @user_pref = Preference.find_by(user_id: @user.id)

    if @user_pref.nil?
      @user_pref = Preference.new
      @user_pref.user = @user
    end

    # raise
    POINT_OF_INTEREST.each { | key, v |  @user_pref[key] = params[key] == 'on' }
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

  end

  def preferences_params
    # params.require(:preference).permit(:camping)
  end
end
