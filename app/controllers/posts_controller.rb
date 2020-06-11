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

  def edit
    @post = Post.find(params[:id])
  end

  def create
      @post = Post.create(post_params)
      redirect_to posts_path
  end

  def read
  end

  def update
      @post = Post.find(params[:id])

      if @post.update(post_params)
        redirect_to @post
      else
        render 'edit'
      end
  end

  def delete
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:image, :caption)
  end
end
