class PostsController < ApplicationController
  def index
    @posts = post.all
  end

  def show; end
end
