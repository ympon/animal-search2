class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def create
    @post = Post.create(post_params)
    @post.save
    redirect_to "/"
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:image, :text)
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end