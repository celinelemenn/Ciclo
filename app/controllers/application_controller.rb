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
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :bio, :blog, :description, :photo, :share_location, :terms, :status])

    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :bio, :blog, :description, :photo, :share_location, :terms, :status])
 end

  # def after_sign_in_path_for(resource)
  #   sign_up_url = user_registration_url
  #   if url_for == sign_up_url
  #   # if resource === new_user_registration_path
  #     map_path
  #   else
  #     map_path
  #   end
  #   # return the path based on resource
  # end
end
