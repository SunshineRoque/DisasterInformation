class WelcomeController < ApplicationController
  def index
    @top_posts = Post.top_posts
    @posts = Post.includes(:disasters, :user).all.ordered_by_comments_count
    @posts = @posts.page(params[:page]).per(6)
  end
end
