class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  before_action :set_i18n_locale_from_params

  protected
		def set_i18n_locale_from_params
			if params[:locale]
				if I18n.available_locales.map(&:to_s).include?(params[:locale])
					I18n.locale = params[:locale]
				else
					flash.now[:notice] = "#{params[:locale]} translation not available"
					logger.error flash.now[:notice]
				end
			end
		end
		
		def default_url_options
			{ locale: I18n.locale }
		end
  
  private
  def current_user
   	@current_user ||= User.find(session[:user_id]) if !User.where(:id => session[:user_id]).empty?
  end
end
