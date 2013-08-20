class Posts::CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  
  def create
  	@comment = Comment.new(comment_params)
		if @comment.save
      redirect_to @comment.post, notice: 'Post was successfully created.' 
    else
      redirect_to @comment.post, notice: 'Fail to create.' 
    end
    
  end

  def destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :desc)
  end
end
