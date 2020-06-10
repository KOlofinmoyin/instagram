class PostsController < ApplicationController
  # index, show, new, edit, create, update and destroy

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
      @post = Post.new
  end

  def create
      @post = Post.create(post_params)
      redirect_to posts_path
  end

  def read
  end

  def update
  end

  def delete
  end

  private
  def post_params
    params.require(:post).permit(:image, :caption)
  end
end
