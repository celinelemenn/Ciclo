class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_navbar_presence
  before_action :check_topmenu_presence
  before_action :check_on_show_poi

  def check_navbar_presence
    @hide_nav = !!ROUTES_NO_NAV.find { |route| route[:controller] == controller_name and route[:action] == action_name }
  end

  def check_topmenu_presence
    @hide_menu = !!ROUTES_NO_MENU.find { |route| route[:controller] == controller_name and route[:action] == action_name }
  end

  def check_on_show_poi
    @show_page = !!ROUTES_BACK_MAP.find { |route| route[:controller] == controller_name and route[:action] == action_name }
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :bio, :blog, :description, :photo, :share_location, :terms])

    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :bio, :blog, :description, :photo, :share_location, :terms])
 end
end
