class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entry

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.entry = @entry
    @comment.save
    redirect_to @entry
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @entry
  end

  protected

  def set_entry
    @entry = Entry.find(params[:entry_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
