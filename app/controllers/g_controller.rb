class GController < ApplicationController
	def index
		@posts = Post.limit(20).order("created_at DESC")
	end

	def user

		unless params[:id] == nil
			@user = User.find_by(username: params[:id])
			redirect_to g_user_path, alert: "No user with that ID exists!" if @user == nil 	
		else
			@user = user_signed_in? ? current_user : User.find_by(username: "kamtr_official")
		end

		@posts = user_posts!
	end

	private

	def user_posts!
		Post.where(user_id: @user.id).order("created_at DESC")
	end
end