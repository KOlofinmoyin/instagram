class PostsController < ApplicationController
  # index, show, new, edit, create, update and destroy

  def index
    @posts = Post.all
  end

  def show
    set_post
  end

  def new
      @post = Post.new
  end

  def edit
    set_post
  end

  def create
      @post = Post.create(post_params)
      redirect_to posts_path
  end

  def read
  end

  def update
      set_post

      if @post.update(post_params)
        redirect_to post_path(@post)
      else
        render 'edit'
      end
  end

  def destroy
      set_post
      @post.destroy
      redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:image, :caption)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
