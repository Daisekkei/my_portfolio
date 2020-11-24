class PostsController < ApplicationController

  def index
    @posts = Post.all
    @customers = Customer.all
  end
  
  def new
  end

  def create
    Post.create(post_params)
    flash[:notice] = '投稿が完了しました'
  end

  private
  def post_params
    params.permit(:content)
  end
  
end
