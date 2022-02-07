class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	protected
		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_in, keys:[:login,:password])
			devise_parameter_sanitizer.permit(:sign_up, keys:[:username,:name,:date_of_birth,:description,:email])
			devise_parameter_sanitizer.permit(:account_update, keys:[:username,:name,:date_of_birth,:description])
		end
end
