class PostsController < ApplicationController

  def index
    @posts = Post.all
    @customers = Customer.all
  end
  
  def new
  end

  def create
    Post.create(post_params)
  end

  private
  def post_params
    params.permit(:content)
  end
  
end
