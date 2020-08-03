class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    @post = Post.create(post_params)
    @post.save
    redirect_to "/"
  end

  private

  def post_params
    params.require(:post).permit(:image, :text)
  end
end