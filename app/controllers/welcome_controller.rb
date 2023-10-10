class WelcomeController < ApplicationController
  def index
    @posts = Post.includes(:disasters, :user).all
    @posts = @posts.page(params[:page]).per(5)
  end
end
