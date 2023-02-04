class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:author).where(author_id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.author_id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(form_params.merge(author: current_user, likesCounter: 0, commentsCounter: 0))

    if @post.save
      redirect_to user_posts_url
    else
      render :new
    end
  end

  private

  def form_params
    params.require(:post).permit(:title, :text)
  end
end
