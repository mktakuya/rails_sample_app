class CommentsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def create 
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to root_url
    else
      flash[:error] = "Comment didn't create..."
      redirect_to root_url
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])

    if current_user_id?(@comment.user_id)
      @comment.destroy
      flash[:success] = "Comment deleted!"
    else
      flash[:error] = "Delete comment error!"
    end
    redirect_to root_url
  end

  private

  def comment_params
    params.require(:comment).permit(:micropost_id, :user_name, :user_id, :content)
  end

end
