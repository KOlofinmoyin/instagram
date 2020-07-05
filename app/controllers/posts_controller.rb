class PostsController < ApplicationController
  # index, show, new, edit, create, update and destroy
before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
          p '[index]'
    @posts = Post.all
  end

  def show
          p '[show]'
  end

  def new
          p '[new]'
      @post = Post.new
  end

  def edit
          p '[edit]'
  end

  def create
      p '[create]'
      if @post = Post.create(post_params)
        flash[:success] = "Your post has been created!"
        redirect_to posts_path
      else
        flash.now[:alert] = "Your new post couldn't be created! Please check the form."
        render 'new'
      end
  end

  def update
          p '[update]'
      if @post.update(post_params)
        flash[:success] = "Post updated."
        redirect_to post_path(@post)
      else
        flash.now[:alert] = "Update failed. Please check the form."
        render 'edit'
      end
  end

  def destroy
          p '[destroy]'
      # if @post.destroy
      #   flash[:success] = "Post Deleted."
      #   redirect_to posts_path
      # else
      #   flash.now[:alert] = "Delete failed. Please try again."
      #   render 'show'
      # end

      @post.destroy!
      redirect_to posts_path #, :notice => "Your post has been deleted!"
  end

  private
  def post_params
    params.require(:post).permit(:image, :caption)
  end

  def set_post
          p '[retrieving specific post id]'
    @post = Post.find(params[:id])
  end
end
