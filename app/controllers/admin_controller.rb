class AdminController < ApplicationController
	def all
		if user_signed_in? && current_user.username=="kamtr_official"
			@users=User.all
		else
			redirect_to g_user_path, alert: "Haha, nice try!"
		end
	end
end