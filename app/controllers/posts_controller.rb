class PostsController < ApplicationController
    before_action :set_post, only: [:update, :destroy]

    def create
        @post = current_user.posts.new(post_params)
        if @post.save
            redirect_to root_path, notice: 'Post was successfully created.'
        end
    end

    def update
        if @post.update(post_params)
            redirect_to root_path, notice: 'Post was successfully updated.'
        end
    end

    def destroy
        @post.destroy
        redirect_to posts_url, notice: 'Post was successfully destroyed.'
    end

    private
    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content)
    end
end
  