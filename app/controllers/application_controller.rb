class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :show_secondary_menu

  # around_action :switch_locale

  def show_secondary_menu
    @show = !!MAIN_MENU_PAGES.find { |route| (route[:controller] == controller_name) && (route[:action] == action_name) }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[full_name bio blog description photo share_location terms status])

    devise_parameter_sanitizer.permit(:account_update, keys: %i[full_name bio blog description photo share_location terms status])
 end


  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end

  def self.default_url_options(options={})
    options.merge({ :locale => I18n.locale })
  end

  # def default_url_options
  # { locale: I18n.locale, host: ENV["DOMAIN"] || "localhost:3000" }
  # end


  def switch_locale(&action)
    if params[:locale]
      locale = params[:locale]
    # elsif request.location
    #   locale = request.location
    # elsif request.env['HTTP_ACCEPT_LANGUAGE']
    #   logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
    #   locale = extract_locale_from_accept_language_header
    #   logger.debug "* Locale set to '#{locale}'"
    else
      locale = I18n.default_locale
    end
    I18n.with_locale(locale, &action)
  end


  def after_sign_in_path_for(resource)
    if resource.sign_in_count == 1
      welcomehome_path
    else map_path
    end
    #   # sign_up_url = user_registration_url
    #   # if url_for == sign_up_url
    #   # # if resource === new_user_registration_path
    #   #   map_path
    #   # else
    #   #   map_path
    #   # end
    #   # return the path based on resource
  end

  private
  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end
end
