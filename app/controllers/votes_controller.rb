class VotesController < ApplicationController
  before_filter :setup
  before_filter :require_login

  def up_vote
    update_vote(1)
    redirect_to :back
  end

  def down_vote
    update_vote(-1)
    redirect_to :back
  end

  private

  def setup
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])

    @vote = @post.votes.where(user_id: current_user.id).first
  end
  
  private
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to acces this section."
      redirect_to root_url #halts request cycle
    end
  end

  def update_vote(new_value)
    if @vote # if it exists, update it
      authorize @vote, :update?
      @vote.update_attribute(:value, new_value)
    else # create it
      @vote = current_user.votes.create(value: new_value, post: @post)
      authorize @vote, :create?
      @vote.save
    end
  end
end