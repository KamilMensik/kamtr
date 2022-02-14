class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:show]

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            redirect_to g_user_path
        else
            render :new, status: :unprocessable_entity
        end
    end
    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to root_path, status: :see_other
    end

    def like
        @post = Post.find(params[:id])
        Like.create(user_id:current_user.id, post_id: @post.id)
        redirect_back(fallback_location: root_path)
    end
    
    def unlike
        @like = Like.where(post_id: params[:id],user_id: current_user.id).first
        @like.destroy
        redirect_back(fallback_location: root_path)
    end

    private
    def post_params
        params.require(:post).permit(:user_id,:content,:is_edited)
    end
end