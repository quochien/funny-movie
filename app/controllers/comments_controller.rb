class CommentsController < ApplicationController
  before_action :auth_user

  def create
    Comment.create(comment_params.merge(user: current_user))

    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_text, :movie_id)
  end
end
