class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    Post.create(post_params)
  end

  private
  
  def post_params
    params.require(:post).permit(:image, :text)
  end
end