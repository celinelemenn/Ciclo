class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_navbar_presence

  def check_navbar_presence
    @hide_nav = !!ROUTES_NO_NAV.find { |route| route[:controller] == controller_name and route[:action] == action_name }
  end

  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :bio, :blog, :description, :photo, :share_location, :terms])

   devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :bio, :blog, :description, :photo, :share_location, :terms])
 end
end
