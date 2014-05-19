class PostsController < ApplicationController
  before_filter :require_login

  def index
    @posts = Post.visible_to(current_user).where("posts.created_at > ?",7.days.ago).paginate(page: params[:page], per_page: 10)
    authorize @posts  
  end

  private
  def require_login
    if !logged_in?
      flash[:error] = "You must be logged in to acces this section."
      redirect_to root_url #halts request cycle
    end
  end
end
