class GController < ApplicationController
	def index
		@posts = Post.limit(20).order("created_at DESC")
	end
	def user
		unless params[:id] == nil
			@user = User.find_by(username: params[:id])
			unless @user == nil 
				@posts = Post.where(user_id: @user.id).order("created_at DESC")
			else
				redirect_to g_user_path, alert: "No user with that ID exists, redirecting to your page!"
			end
		else
			user_signed_in? ? @user = current_user : @user = User.find_by(username: "kamtr_official")
			@posts = Post.where(user_id: @user.id).order("created_at DESC")
		end
	end
end