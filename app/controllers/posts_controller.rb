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
            puts post_params
            redirect_to @post
        else
            puts post_params
            render :new, status: :unprocessable_entity
        end
    end
    def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path, status: :see_other
  end
    private
    def post_params
        params.require(:post).permit(:user_id,:content,:is_edited)
    end
end