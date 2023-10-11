class User::PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts.all.ordered_by_comments_count
    @posts = @posts.page(params[:page]).per(6)
  end

end