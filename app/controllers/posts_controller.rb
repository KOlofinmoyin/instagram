class PostsController < ApplicationController
  # index, show, new, edit, create, update and destroy

  def index
    @posts = Post.all
  end

  def new
      @post = Post.new
  end

  def create
      @post = Post.create(post_params)
      @post.save
      redirect_to posts_path
      #
      # @post = Post.new(post_params)
      #
      # if @post.save
      #   redirect_to posts_path
      # else
      #   render 'new'
      # end

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
