class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  USER, PASSWORD = 'alina', 'alina'

  before_action :set_i18n_locale_from_params, :authorize

protected

  def authorize
  	if request.format != Mime[:html]
	  	authenticate_or_request_with_http_basic do |username, password|
	      username == USER && password == PASSWORD
	    end

	    # authenticate_or_request_with_http_basic username: USER, password: PASSWORD
	else
	    unless User.find_by(id: session[:user_id])
	      redirect_to login_url, notice: "Please log in"
	    end
	end	
  end

	def set_i18n_locale_from_params
		if params[:locale]
			if I18n.available_locales.map(&:to_s).include?(params[:locale])
				I18n.locale = params[:locale]
			else
				flash.now[:notice] ="#{params[:locale]} translation not available"
				logger.error flash.now[:notice]
			end
		end
	end
end
