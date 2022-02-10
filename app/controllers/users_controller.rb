class UsersController < ApplicationController
	def destroy
		if user_signed_in?
			if current_user.username=="kamtr_official"
				@user = User.find(params[:id])
	    		@user.destroy
	    		redirect_to root_path, status: :see_other
			else
				redirect_to g_user_path, alert: "Haha, nice try!"
			end
		else
			redirect_to g_user_path, alert: "Haha, nice try!"
		end
  	end
end