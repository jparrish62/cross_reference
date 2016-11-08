class CommentsController < ApplicationController
  before_action :find_commentable

def new
  @comment = Comment.new
end

def create
  @comment = @commentable.comments.new comment_params
  @comment.user_name = current_user.user_name
  if @comment.save
    respond_to do |format|
      format.html { redirect_to :back }
      format.js {}
    end
  else
    render 'walmart_products/index'
  end
end

private
def comment_params
  params.require(:comment).permit(:body)
end

def find_commentable
   @commentable = Comment.find_by(id: params[:comment_id]) if params[:comment_id]
   @commentable = WalmartProduct.find_by(id: params[:walmart_product_id]) if params[:walmart_product_id]
 end
end
