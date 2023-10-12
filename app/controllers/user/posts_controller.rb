class User::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: :destroy

  def index
    @posts = current_user.posts.all.ordered_by_comments_count
    @posts = @posts.page(params[:page]).per(6)
  end

  def destroy
    @post.destroy
    flash[:notice] = 'Post destroyed successfully'
    redirect_to user_posts_path
  end

  def set_post
    @post = Post.find(params[:id])
  end
end